# Generar 6 intentos de inicio de sesión fallidos (Event ID 4625)
$secpasswd = ConvertTo-SecureString "ClaveIncorrecta123!" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("UsuarioFalso", $secpasswd)

for($i=1; $i -le 6; $i++){
    try { 
        Start-Process -FilePath "cmd.exe" -Credential $cred -ErrorAction SilentlyContinue 
    } catch {}
    Start-Sleep -Milliseconds 500
}