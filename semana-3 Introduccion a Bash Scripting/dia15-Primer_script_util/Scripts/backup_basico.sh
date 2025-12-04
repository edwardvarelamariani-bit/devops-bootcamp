#!/bin/bash

echo "💾 SCRIPT DE BACKUP BÁSICO"
echo "=========================="

# Configuración
CARPETA_ORIGEN="./"
CARPETA_BACKUP="./backups"
FECHA=$(date +%Y%m%d_%H%M%S)

# Crear carpeta de backups si no existe
echo "📁 Creando carpeta de backups..."
mkdir -p "$CARPETA_BACKUP"

# Contar archivos .txt
NUM_ARCHIVOS=$(find "$CARPETA_ORIGEN" -name "*.txt" | wc -l)

if [ $NUM_ARCHIVOS -eq 0 ]; then
    echo "❌ No se encontraron archivos .txt para hacer backup"
    exit 1
fi

echo "📊 Encontrados $NUM_ARCHIVOS archivos .txt"

# Crear backup
NOMBRE_BACKUP="backup_txt_$FECHA.tar.gz"
echo "🔄 Creando backup: $NOMBRE_BACKUP"

if tar -czf "$CARPETA_BACKUP/$NOMBRE_BACKUP" *.txt 2>/dev/null; then
    echo "✅ Backup creado exitosamente!"
    echo "📍 Ubicación: $CARPETA_BACKUP/$NOMBRE_BACKUP"
    echo "📦 Tamaño: $(du -h "$CARPETA_BACKUP/$NOMBRE_BACKUP" | cut -f1)"
else
    echo "❌ Error al crear el backup"
    exit 1
fi

# Listar backups existentes
echo ""
echo "📋 BACKUPS EXISTENTES:"
ls -la "$CARPETA_BACKUP"/backup_txt_* 2>/dev/null | head -5

