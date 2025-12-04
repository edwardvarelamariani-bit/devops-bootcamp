#!/bin/bash

echo "🗂️  ORGANIZADOR DE ARCHIVOS AUTOMÁTICO"
echo "===================================="

# Crear algunos archivos de prueba primero
echo "📝 Creando archivos de prueba..."
touch documento1.txt documento2.txt
touch imagen1.jpg imagen2.png
touch script1.sh script2.bash
touch data1.csv data2.log

echo "📋 Archivos actuales:"
ls -la

echo ""
echo "🚀 Organizando archivos..."
echo ""

# Crear directorios por tipo
mkdir -p textos imagenes scripts datos

# Mover archivos de texto
for archivo in *.txt; do
    if [ -f "$archivo" ]; then
        echo "📄 Moviendo $archivo a textos/"
        mv "$archivo" textos/
    fi
done

# Mover imágenes
for archivo in *.jpg *.png *.gif; do
    if [ -f "$archivo" ]; then
        echo "🖼️  Moviendo $archivo a imagenes/"
        mv "$archivo" imagenes/
    fi
done

# Mover scripts
for archivo in *.sh *.bash; do
    if [ -f "$archivo" ]; then
        echo "🐧 Moviendo $archivo a scripts/"
        mv "$archivo" scripts/
    fi
done

# Mover otros archivos de datos
for archivo in *.csv *.log; do
    if [ -f "$archivo" ]; then
        echo "📊 Moviendo $archivo a datos/"
        mv "$archivo" datos/
    fi
done

echo ""
echo "✅ Organización completada!"
echo ""
echo "📂 Estructura final:"
find . -type d -name "textos" -o -name "imagenes" -o -name "scripts" -o -name "datos" | head -10
