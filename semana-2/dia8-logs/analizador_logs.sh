#!/bin/bash
# Analizador de logs
# Uso: ./analizador_logs.sh [archivo_log]

ARCHIVO_LOG="${1:-/tmp/logs_practica/app.log}"

if [[ ! -f "$ARCHIVO_LOG" ]]; then
    echo "❌ Archivo de log no encontrado: $ARCHIVO_LOG"
    echo "💡 Ejecuta primero: ./log_generator.sh"
    exit 1
fi

echo "=== 🔍 ANALIZADOR DE LOGS ==="
echo "Archivo: $ARCHIVO_LOG"
echo ""

echo "--- 📈 ESTADÍSTICAS ---"
TOTAL_LINEAS=$(wc -l < "$ARCHIVO_LOG")
echo "📊 Total de líneas: $TOTAL_LINEAS"
echo "ℹ️  Líneas INFO: $(grep -c "INFO" "$ARCHIVO_LOG")"
echo "⚠️  Líneas WARNING: $(grep -c "WARNING" "$ARCHIVO_LOG")"
echo "🚨 Líneas ERROR: $(grep -c "ERROR" "$ARCHIVO_LOG")"
echo "🐛 Líneas DEBUG: $(grep -c "DEBUG" "$ARCHIVO_LOG")"

echo ""
echo "--- 🕒 DISTRIBUCIÓN TEMPORAL ---"
echo "🕐 Primera entrada: $(head -1 "$ARCHIVO_LOG" | cut -d' ' -f1-2)"
echo "🕤 Última entrada: $(tail -1 "$ARCHIVO_LOG" | cut -d' ' -f1-2)"

echo ""
echo "--- 🚨 ÚLTIMOS ERRORES ---"
grep "ERROR" "$ARCHIVO_LOG" | tail -3 | while read line; do
    echo "❌ $line"
done

echo ""
echo "--- ⚠️  ÚLTIMAS ADVERTENCIAS ---"
grep "WARNING" "$ARCHIVO_LOG" | tail -3 | while read line; do
    echo "⚠️  $line"
done

echo ""
echo "--- 📋 ACTIVIDAD RECIENTE ---"
tail -8 "$ARCHIVO_LOG" | while read line; do
    echo "📄 $line"
done

echo ""
echo "✅ Análisis completado"
