# PowerShell Tests — Simulación de Amenazas para Validar Event Handlers

Este directorio contiene scripts de PowerShell para generar eventos de Windows que disparen los event handlers configurados en FortiAnalyzer. Úsalos en entornos de **laboratorio o pruebas controladas** para validar que el pipeline completo (NXLog → FAZ → Event Handler) está funcionando correctamente.

> ⚠️ **Advertencia:** No ejecutar en entornos de producción. Algunos scripts crean usuarios locales, instalan servicios o borran logs del sistema.

## Requisitos

- PowerShell 5.1 o superior
- Ejecutar como **Administrador**
- Tener NXLog activo y apuntando al FortiAnalyzer

## Cómo ejecutar

```powershell
# Abrir PowerShell como Administrador
Set-ExecutionPolicy Bypass -Scope Process -Force

# Ejecutar el script deseado:
.\WIN-Auth-BruteForce.ps1
.\WIN-Account-Manipulation.ps1
.\WIN-Evasion-And-LotL.ps1
```

---

## Scripts

### WIN-Auth-BruteForce.ps1

Genera 6 intentos de autenticación fallidos (Event ID 4625) usando credenciales incorrectas. Esto supera el umbral de 5 del handler `WIN-LOG-Auth-BruteForce`.

**Eventos generados:** 4625 (x6)

---

### WIN-Account-Manipulation.ps1

Simula el ciclo completo de manipulación de una cuenta:
1. Crea el usuario `CuentaHacker` → Event ID **4720**
2. Habilita la cuenta → Event ID **4722**
3. Modifica la cuenta (agrega comentario) → Event ID **4738**
4. Elimina la cuenta (limpieza) → Event ID **4726** (si se descomenta)

**Eventos generados:** 4720, 4722, 4738

---

### WIN-Evasion-And-LotL.ps1

Simula técnicas de evasión y Living off the Land:
1. Lanza PowerShell como subproceso oculto → Event ID **4688**
2. Instala un servicio falso (`ServicioMalicioso`) → Event ID **7045**
3. Borra el log de Security → Event ID **1102**

**Eventos generados:** 4688, 7045, 1102

> ⚠️ El paso 3 borra el log de seguridad real. Ejecutar solo en VMs o entornos de lab.

---

## Verificación en FortiAnalyzer

Después de ejecutar los scripts, verificar en FAZ:

1. **Logs recibidos:** Security Fabric → Log View → filtrar por el hostname del equipo de prueba
2. **Alertas generadas:** Security Fabric → Event Handler → ver eventos activos
3. **Tiempo aproximado:** los eventos deberían aparecer en FAZ en 30-60 segundos
