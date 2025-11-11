#!/bin/bash

echo "=== VERIFICADOR DE VARIABLES ==="

# Solicita nombre al usuario
echo -n "Introduce tu nombre: "
read NOMBRE
echo "Variable NOMBRE: '$NOMBRE'"

if [ -n "$NOMBRE" ]; then
    echo "✅ La variable NOMBRE NO está vacía"
else
    echo "❌ La variable NOMBRE está vacía"
fi

# Ejemplo con variable vacía
APELLIDO=""
echo -e "\nVariable APELLIDO: '$APELLIDO'"

if [ -z "$APELLIDO" ]; then
    echo "✅ La variable APELLIDO está vacía (confirmado)"
else
    echo "❌ La variable APELLIDO NO está vacía"
fi

# Ejemplo práctico: variable de entorno
echo -e "\n=== VARIABLES DE ENTORNO ==="
if [ -z "$PATH" ]; then
    echo "❌ ALERTA: PATH está vacío - esto no debería pasar!"
else
    echo "✅ PATH está configurado correctamente"
    echo "   Número de directorios en PATH: $(echo $PATH | tr ':' '\n' | wc -l)"
fi
