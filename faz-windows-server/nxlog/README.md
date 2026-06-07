# NXLog — Configuración para reenvío de logs a FortiAnalyzer

Este directorio contiene el archivo de configuración de **NXLog Community Edition** para reenviar eventos de seguridad de Windows al FortiAnalyzer via syslog UDP.

## Ubicación del archivo de configuración

```
C:\Program Files\nxlog\conf\nxlog.conf
```

## Eventos capturados

La configuración captura los siguientes Event IDs del canal **Security** y **System**:

- **4624** — Inicio de sesión exitoso
- **4625** — Inicio de sesión fallido
- **4688** — Nuevo proceso creado
- **4720** — Cuenta de usuario creada
- **4722** — Cuenta de usuario habilitada
- **4726** — Cuenta de usuario eliminada
- **4738** — Cuenta de usuario modificada
- **1102** — Log de auditoría borrado
- **7045** — Nuevo servicio instalado (canal System)

## Parámetro a editar antes de usar

En la sección `<Output out_fortianalyzer>`, cambiar la IP por la dirección de tu FortiAnalyzer:

```
Host  <IP_DE_TU_FAZ>
Port  514
```

## Reiniciar el servicio

```powershell
Restart-Service nxlog
# Verificar estado
Get-Service nxlog
```
