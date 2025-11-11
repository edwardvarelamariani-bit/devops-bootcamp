#!/bin/bash
# Monitor de Salud del Sistema - Verifica estado general del sistema
# Uso: ./monitor_salud.sh

echo "=== 🩺 MONITOR DE SALUD DEL SISTEMA ==="
echo ""

# Línea 1: Obtener fecha y hora actual
# $(date) ejecuta el comando 'date' y captura su salida
echo "🕐 Fecha y Hora: $(date)"

# Línea 2: Mostrar nombre del host (máquina)
# hostname muestra el nombre del equipo
echo "🖥️  Hostname: $(hostname)"

# Línea 3: Mostrar usuario actual
# whoami muestra el usuario que ejecuta el script
echo "👤 Usuario: $(whoami)"

echo ""
echo "--- 📊 USO DE MEMORIA ---"

# Línea 4: Verificar si el comando 'free' existe
# command -v verifica si un comando está disponible
# &>/dev/null redirige salida y errores a la nada (silencia)
if command -v free &>/dev/null; then
    # Línea 5: Si free existe, mostrar memoria en formato humano
    # -h flag muestra en GB/MB en lugar de bytes
    echo "💾 Memoria RAM:"
    free -h | grep -E "(Mem|total)" | head -2
else
    # Línea 6: Si no hay 'free', usar 'vm_stat' (macOS)
    echo "💾 Memoria (macOS):"
    vm_stat | head -8
fi

echo ""
echo "--- 💾 ESPACIO EN DISCO ---"

# Línea 7: Mostrar uso de disco
# df -h muestra espacio en disco en formato humano
# head -6 muestra solo las primeras 6 líneas
# 2>/dev/null silencia errores si el comando falla
echo "📁 Uso de disco:"
df -h 2>/dev/null | head -6 || echo "❌ No se pudo obtener información de disco"

echo ""
echo "--- 🔥 CARGA DEL SISTEMA ---"

# Línea 8: Mostrar carga del sistema
# uptime muestra tiempo activo y carga promedio
echo "⚡ Carga del sistema:"
uptime 2>/dev/null | cut -d',' -f4- || echo "❌ No se pudo obtener carga del sistema"

echo ""
echo "--- 🌡️  TEMPERATURA (si está disponible) ---"

# Línea 9: Intentar obtener temperatura (solo en algunos sistemas)
# sensors es un comando que muestra temperaturas de hardware
if command -v sensors &>/dev/null; then
    echo "🌡️  Temperaturas:"
    sensors 2>/dev/null | grep -E "(Core|CPU)" | head -3
else
    echo "ℹ️  Información de temperatura no disponible"
fi

echo ""
echo "--- 📈 PROCESOS CRÍTICOS ---"

# Línea 10: Mostrar los 3 procesos que más CPU usan
# ps aux lista todos los procesos
# --sort=-%cpu ordena por CPU descendente
# head -4 muestra primeros 4 (incluye header)
echo "🔥 Top 3 procesos por CPU:"
ps aux --sort=-%cpu 2>/dev/null | head -4 | awk '{printf "   %-10s %-6s %-4s %s\n", $1, $2, $3, $11}'

echo ""
echo "--- 🚨 VERIFICACIONES RÁPIDAS ---"

# Línea 11: Verificar si hay actualizaciones pendientes (solo Linux)
# -c cuenta líneas en lugar de mostrarlas
if command -v apt-get &>/dev/null; then
    updates=$(apt-get -s upgrade 2>/dev/null | grep -c "^Inst")
    echo "🔄 Actualizaciones pendientes: $updates"
else
    echo "🔄 Sistema: $(uname -s) - Verifica actualizaciones manualmente"
fi

# Línea 12: Verificar espacio en /tmp
# du -s muestra uso total de disco de un directorio
# cut -f1 extrae solo el primer campo (el número)
tmp_usage=$(du -s /tmp 2>/dev/null | cut -f1)
if [ -n "$tmp_usage" ]; then
    echo "📦 Uso de /tmp: ${tmp_usage}KB"
else
    echo "📦 /tmp: No se pudo verificar"
fi

echo ""
echo "✅ Monitoreo completado - Sistema $( [ $? -eq 0 ] && echo "saludable" || echo "con advertencias" )"