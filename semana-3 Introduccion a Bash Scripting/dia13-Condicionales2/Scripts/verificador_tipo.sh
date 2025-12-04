#!/bin/bash

echo "📁 VERIFICADOR DE TIPO DE ARCHIVO"
echo "================================"

read -p "Introduce la ruta de un archivo: " archivo

if [ ! -e "$archivo" ]; then
    echo "❌ El archivo no existe"
    exit 1
fi

case "$archivo" in
    *.txt | *.md)
        echo "📝 Es un archivo de texto"
        echo "   Puedes editarlo con: nano $archivo"
        ;;
    *.sh | *.bash)
        echo "🐧 Es un script de Bash"
        echo "   Puedes ejecutarlo con: ./$archivo"
        ;;
    *.jpg | *.png | *.gif)
        echo "🖼️  Es una imagen"
        echo "   Puedes verla con: xdg-open $archivo"
        ;;
    *.zip | *.tar | *.gz)
        echo "📦 Es un archivo comprimido"
        echo "   Puedes descomprimirlo con: tar -xf $archivo"
        ;;
    */)
        echo "📁 Es un directorio"
        echo "   Puedes entrar con: cd $archivo"
        ;;
    *)
        echo "❓ Tipo de archivo desconocido"
        echo "   Extensión: ${archivo##*.}"
        ;;
esac

# Verificar permisos
echo ""
echo "🔐 Permisos:"
if [ -r "$archivo" ]; then
    echo "   ✅ Lectura: Permitido"
else
    echo "   ❌ Lectura: Denegado"
fi

if [ -w "$archivo" ]; then
    echo "   ✅ Escritura: Permitido"
else
    echo "   ❌ Escritura: Denegado"
fi

if [ -x "$archivo" ]; then
    echo "   ✅ Ejecución: Permitido"
else
    echo "   ❌ Ejecución: Denegado"
fi
