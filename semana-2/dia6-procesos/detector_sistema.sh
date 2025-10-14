#!/bin/bash
# Detector de sistema operativo
# Uso: ./detector_sistema.sh

echo "🔍 DETECTANDO SISTEMA..."
echo ""

SISTEMA=$(uname -s)
VERSION=$(uname -r)

case $SISTEMA in
    "Darwin")
        echo "🍎 Estás en macOS"
        echo "📋 Versión: $VERSION"
        ;;
    "Linux")
        echo "🐧 Estás en Linux"
        # Detectar si es WSL
        if grep -qi microsoft /proc/version 2>/dev/null; then
            echo "🪟 WSL (Windows Subsystem for Linux)"
        fi
        echo "📋 Versión: $VERSION"
        ;;
    "MINGW"*|"CYGWIN"*)
        echo "🪟 Estás en Windows con Git Bash/Cygwin"
        ;;
    *)
        echo "❓ Sistema no identificado: $SISTEMA"
        ;;
esac

echo ""
echo "=== HERRAMIENTAS DISPONIBLES ==="
echo "🔧 whoami: $(command -v whoami || echo 'No disponible')"
echo "🔧 ps: $(command -v ps || echo 'No disponible')" 
echo "🔧 top: $(command -v top || echo 'No disponible')"
echo "🔧 grep: $(command -v grep || echo 'No disponible')"

# Comandos específicos por sistema
if [[ "$SISTEMA" == "Darwin" ]]; then
    echo "🔧 vm_stat: $(command -v vm_stat || echo 'No disponible')"
else
    echo "🔧 free: $(command -v free || echo 'No disponible')"
fi

echo ""
echo "✅ Detección completada"
