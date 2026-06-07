# 1. Crear un nuevo usuario (Genera Event ID 4720 y usualmente 4722/4738 concurrentes)
net user CuentaHacker P@ssw0rd_SOC! /add

# 2. Habilitar la cuenta explícitamente (Genera Event ID 4722)
net user CuentaHacker /active:yes

# 3. Modificar la cuenta agregando un comentario (Genera Event ID 4738)
net user CuentaHacker /comment:"Cuenta de Persistencia"

# Limpieza (Para no dejar la máquina vulnerable)
net user CuentaHacker /delete