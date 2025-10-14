#!/bin/bash
# Script que funciona en macOS y Linux/WSL
# Uso: ./script_universal.sh

echo "=== INFORMACIÓN DEL SISTEMA UNIVERSAL ==="
echo ""

# Información básica (común)
echo "🖥️  Hostname: $(hostname)"
echo "👤 Usuario: $(whoami)"
echo "💻 Sistema: $(uname -s)"
echo "🔧 Kernel: $(uname -r)"
echo "🏗️  Arquitectura: $(uname -m)"
echo "📁 Directorio actual: $(pwd)"

echo ""
echo "=== MEMORIA ==="

# Detectar sistema y mostrar memoria apropiada
SISTEMA=$(uname -s)

if [[ "$SISTEMA" == "Darwin" ]]; then
    echo "🍎 macOS detectado"
    echo "Memoria:"
    vm_stat | head -8
elif [[ "$SISTEMA" == "Linux" ]]; then
    echo "🐧 Linux detectado"
    echo "Memoria:"
    free -h | head -2
else
    echo "❓ Sistema no identificado"
    echo "Usa el administrador de tareas para ver memoria"
fi

echo ""
echo "=== ESPACIO EN DISCO ==="
df -h 2>/dev/null | head -6 || echo "Comando df no disponible en este sistema"

echo ""
echo "=== VARIABLES IMPORTANTES ==="
echo "Shell: $SHELL"
echo "Usuario: $USER"
echo "Home: $HOME"

echo ""
echo "✅ Script ejecutado en: $(date)"
