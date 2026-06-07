# Log Parser — Windows Event Log Parser NXLog

Este directorio contiene el archivo de **Log Parser** para importar en FortiAnalyzer. El parser normaliza los logs de Windows recibidos desde NXLog (formato JSON) o desde FortiClient.

## Información del Parser

| Campo | Valor |
|---|---|
| Nombre | Windows Event Log Parser NXLog |
| Categoría | Endpoint Devices |
| Aplicación | Windows |
| Autor | FortiAnalyzer, Fortinet Inc. |
| Versión FAZ | 7.6.4 |

## Fuentes de datos soportadas

1. **FortiClient (fct-forwarded):** Logs reenviados automáticamente por el agente FortiClient instalado en el endpoint.
2. **Syslog desde NXLog:** Logs enviados en formato JSON con campo `EventTime` vía syslog UDP.

## Cómo importar en FortiAnalyzer

1. Ir a **Security Fabric → Log Parser**
2. Clic en **Import**
3. Seleccionar el archivo `Windows Event Log Parser NXLog.txt`
4. Confirmar la importación

## Campos normalizados principales

| Campo FAZ | Origen |
|---|---|
| `event_id` | EventID del log de Windows |
| `host_name` | Hostname del equipo |
| `user_name` | Usuario objetivo del evento |
| `src_ip` | IP de origen de la conexión |
| `process_name` | Nombre del proceso involucrado |
| `event_profile` | Descripción legible del evento |
| `data_sourcetype` | Tipo: `Windows JSON Event` o `Windows XML Event` |
