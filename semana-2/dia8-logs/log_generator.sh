#!/bin/bash
# Generador de logs para prácticas
# Uso: ./log_generator.sh [param1] [param2]

LOGFILE="/tmp/logs_practica/app.log"
mkdir -p "/tmp/logs_practica"

echo "=== 📝 GENERADOR DE LOGS ==="
echo "Archivo: $LOGFILE"
echo "Parámetros recibidos: $@"
echo ""

echo "$(date '+%Y-%m-%d %H:%M:%S'): INFO - Script de log iniciado" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): DEBUG - Parámetros: $@" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): INFO - Usuario: $(whoami)" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): INFO - Directorio: $(pwd)" >> $LOGFILE

sleep 1

# Simular diferentes tipos de eventos
echo "$(date '+%Y-%m-%d %H:%M:%S'): WARNING - Advertencia de prueba número 1" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): ERROR - Error simulado: Archivo no encontrado" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): INFO - Procesando datos..." >> $LOGFILE

sleep 1

echo "$(date '+%Y-%m-%d %H:%M:%S'): WARNING - Advertencia de prueba número 2" >> $LOGFILE
echo "$(date '+%Y-%m-%d %H:%M:%S'): INFO - Operación completada exitosamente" >> $LOGFILE

echo ""
echo "=== 📊 CONTENIDO GENERADO ==="
cat $LOGFILE

echo ""
echo "✅ Log generado exitosamente en: $LOGFILE"
