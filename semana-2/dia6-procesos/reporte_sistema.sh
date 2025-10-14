#!/bin/bash
# Script para generar reporte de procesos del sistema
# Uso: ./reporte_sistema.sh

echo "=== 📊 REPORTE DE PROCESOS - $(date) ==="
echo ""

echo "--- TOP 5 PROCESOS POR CPU ---"
ps aux --sort=-%cpu 2>/dev/null | head -6 | awk '{printf "👤 %-12s 🆔 %-6s ⚡ %-4s 💾 %-4s 📝 %s\n", $1, $2, $3, $4, $11}'

echo ""
echo "--- TOP 5 PROCESOS POR MEMORIA ---"  
ps aux --sort=-%mem 2>/dev/null | head -6 | awk '{printf "👤 %-12s 🆔 %-6s ⚡ %-4s 💾 %-4s 📝 %s\n", $1, $2, $3, $4, $11}'

echo ""
echo "--- MIS PROCESOS ACTIVOS ---"
echo "👤 Usuario: $(whoami)"
echo "📊 Total procesos: $(ps -u $(whoami) 2>/dev/null | wc -l)"

echo ""
echo "--- INFORMACIÓN DEL SISTEMA ---"
echo "🏗️  Arquitectura: $(uname -m)"
echo "💻 Núcleo: $(uname -r)"

echo ""
echo "✅ Reporte generado exitosamente"
