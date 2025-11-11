#!/bin/bash

echo "=== VERIFICADOR DE ARCHIVOS ==="

# Pedir el nombre del archivo al usuario
echo -n "Introduce la ruta del archivo: "
read ARCHIVO

# Verificar si el archivo existe
if [ -f "$ARCHIVO" ]; then
    echo "✅ El archivo '$ARCHIVO' EXISTE"
    
    # Verificar permisos
    if [ -r "$ARCHIVO" ]; then
        echo "   - Tienes permiso de lectura"
    else
        echo "   - NO tienes permiso de lectura"
    fi
    
    if [ -w "$ARCHIVO" ]; then
        echo "   - Tienes permiso de escritura"
    else
        echo "   - NO tienes permiso de escritura"
    fi
    
    # Mostrar información del archivo
    echo "   - Tamaño: $(ls -lh "$ARCHIVO" | awk '{print $5}')"
    echo "   - Fecha modificación: $(ls -l "$ARCHIVO" | awk '{print $6, $7, $8}')"
    
else
    echo "❌ El archivo '$ARCHIVO' NO EXISTE"
    
    # Preguntar si quiere crearlo
    echo -n "¿Quieres crearlo? (s/n): "
    read RESPUESTA
    
    if [ "$RESPUESTA" = "s" ] || [ "$RESPUESTA" = "S" ]; then
        touch "$ARCHIVO"
        echo "📄 Archivo '$ARCHIVO' creado exitosamente"
    else
        echo "Operación cancelada"
    fi
fi

