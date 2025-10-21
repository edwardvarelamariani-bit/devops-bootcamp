#!/bin/bash
# Script para organizar archivos por tipo
# Uso: ./organizador_archivos.sh

echo "=== ORGANIZADOR DE ARCHIVOS ==="
echo "Creando estructura de carpetas..."

# Crear carpetas organizadas
mkdir -p organizado/{documentos,imagenes,scripts,logs,otros}

echo "Moviendo archivos por tipo..."

# Mover archivos de texto
mv *.txt organizado/documentos/ 2>/dev/null && echo "📄 Textos movidos"

# Mover imágenes
mv *.jpg *.png *.gif organizado/imagenes/ 2>/dev/null && echo "🖼️  Imágenes movidas"

# Mover scripts
mv *.sh organizado/scripts/ 2>/dev/null && echo "📜 Scripts movidos"

# Mover logs
mv *.log organizado/logs/ 2>/dev/null && echo "📊 Logs movidos"

# Mover otros
mv *.pdf *.doc *.docx organizado/otros/ 2>/dev/null && echo "📎 Otros archivos movidos"

echo ""
echo "=== ESTRUCTURA FINAL ==="
find organizado -type f | sort | while read file; do
    echo "📁 $file"
done

echo ""
echo "✅ Organización completada"
