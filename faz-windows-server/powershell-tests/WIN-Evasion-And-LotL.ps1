# 1. Generar Creación de Nuevo Proceso sospechoso (Event ID 4688)
# Nota: Requiere tener habilitada la GPO "Audit Process Creation"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command `"Write-Host 'Test LotL'`""

# 2. Instalación de un Nuevo Servicio (Genera Event ID 7045 en el log SYSTEM)
New-Service -Name "ServicioMalicioso" -BinaryPathName "C:\Windows\System32\cmd.exe /k" -DisplayName "Windows Update Helper" -Description "Fake service for SOC testing"
Start-Sleep -Seconds 2
# Limpieza del servicio
# Remove-Service -Name "ServicioMalicioso"
sc.exe delete ServicioMalicioso

# 3. Evasión de defensas: Borrado de registros de auditoría (Genera Event ID 1102)
# Advertencia: Esto borrará el log de Seguridad real. Hazlo solo en entornos de prueba.
Clear-EventLog -LogName Security