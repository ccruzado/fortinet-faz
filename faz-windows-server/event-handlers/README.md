# Event Handlers — Detección de Amenazas en Windows

Este directorio contiene los 3 event handlers de FortiAnalyzer para detectar amenazas basadas en los logs de Windows. El archivo `.conf` puede importarse directamente via CLI del FAZ.

## Cómo importar los Event Handlers

### Opción 1 — Importar via CLI (recomendado)

1. Conectarse al FortiAnalyzer por SSH o consola.
2. Ingresar al modo de configuración:
   ```
   config alert basic-handler
   ```
3. Pegar el contenido del archivo `WIN-LOG-Evasion and 2 more.conf`.
4. Ejecutar `end` para confirmar.

### Opción 2 — Crear manualmente en la GUI

1. Ir a **Security Fabric → Event Handler → Create New**
2. Completar los campos de cada handler según la descripción siguiente.

---

## Handler 1: WIN-LOG-Auth-BruteForce

**Descripción:** Detecta ataques de fuerza bruta contra cuentas Windows. Se dispara cuando el mismo usuario o IP genera 5 o más fallos de autenticación en 1 minuto.

| Campo | Valor |
|---|---|
| MITRE ATT&CK | T1078, T1110, T1110.001, T1110.003 |
| Severidad | Medium |
| Agrupar por | `user_name`, `src_ip` |
| Filtro | `event_id='4625'` |
| Condición | `COUNT(*) >= 5` en 1 minuto |
| Indicador | `src_ip` (tipo IP) |

---

## Handler 2: WIN-LOG-Account-Manipulation

**Descripción:** Detecta manipulación de cuentas de usuario: creación, habilitación, modificación y eliminación. Útil para detectar creación de cuentas persistentes por un atacante.

| Campo | Valor |
|---|---|
| MITRE ATT&CK | T1136, T1098 |
| Severidad | Medium |
| Agrupar por | `user_name` |

**Reglas incluidas:**

| Regla | Filtro | Descripción |
|---|---|---|
| eventid 4720 | `event_id='4720'` | Cuenta de usuario creada |
| eventid 4722 | `event_id='4722'` | Cuenta de usuario habilitada |
| eventid 4738 | `event_id='4738'` | Cuenta de usuario modificada |
| eventid 4726 | `event_id='4726'` | Cuenta de usuario eliminada |

---

## Handler 3: WIN-LOG-Evasion

**Descripción:** Detecta técnicas de evasión de defensas y Living off the Land (LotL). Cubre borrado de logs, instalación de servicios maliciosos y ejecución de PowerShell como subproceso.

| Campo | Valor |
|---|---|
| MITRE ATT&CK | T1543.003, T1070.001 |
| Severidad | High |
| Agrupar por | `host_name`, `user_name` |
| Filtro | `(event_id='1102') or (event_id='7045') or (event_id='4688' and process_name='*powershell.exe*')` |
| Condición | `COUNT(*) >= 1` en 30 minutos |
