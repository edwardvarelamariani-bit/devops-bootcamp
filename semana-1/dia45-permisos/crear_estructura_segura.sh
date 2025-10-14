#!/bin/bash
# Script para crear estructura con diferentes niveles de permisos
# Uso: ./crear_estructura_segura.sh

echo "=== CREANDO ESTRUCTURA DE SEGURIDAD ==="

# Crear estructura de carpetas
mkdir -p seguridad/{publico,privado,ejecutables,compartido}

echo "Creando archivos de prueba..."

# Crear archivos de prueba
echo "Información pública" > seguridad/publico/info_publica.txt
echo "Secretos importantes" > seguridad/privado/secretos.txt
echo "#!/bin/bash\necho 'Script ejecutable'" > seguridad/ejecutables/mi_script.sh
echo "Trabajo en equipo" > seguridad/compartido/trabajo_grupo.txt

echo "Aplicando permisos..."

# Aplicar permisos a CARPETAS
chmod 755 seguridad/publico/           # rwxr-xr-x
chmod 700 seguridad/privado/           # rwx------
chmod 711 seguridad/ejecutables/       # rwx--x--x
chmod 775 seguridad/compartido/        # rwxrwxr-x

# Aplicar permisos a ARCHIVOS
chmod 644 seguridad/publico/info_publica.txt    # rw-r--r--
chmod 600 seguridad/privado/secretos.txt        # rw-------
chmod 744 seguridad/ejecutables/mi_script.sh    # rwxr--r--
chmod 664 seguridad/compartido/trabajo_grupo.txt # rw-rw-r--

echo ""
echo "=== VERIFICACIÓN DE PERMISOS ==="
echo "Estructura creada:"
ls -la seguridad/

echo ""
echo "=== EXPLICACIÓN DE PERMISOS ==="
echo "publico/:      755 - Todos pueden leer/ejecutar"
echo "privado/:      700 - Solo dueño puede acceder"
echo "ejecutables/:  711 - Todos pueden ejecutar, solo dueño ver contenido"
echo "compartido/:   775 - Dueño y grupo pueden modificar"
