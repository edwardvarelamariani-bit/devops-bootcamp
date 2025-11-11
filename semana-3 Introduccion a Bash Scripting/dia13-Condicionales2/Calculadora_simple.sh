#!/bin/bash

echo "🧮 CALCULADORA SIMPLE"
echo "===================="

read -p "Primer número: " num1
read -p "Operación (+, -, *, /): " operacion
read -p "Segundo número: " num2

case $operacion in
    "+")
        resultado=$((num1 + num2))
        echo "✅ $num1 + $num2 = $resultado"
        ;;
    "-")
        resultado=$((num1 - num2))
        echo "✅ $num1 - $num2 = $resultado"
        ;;
    "*")
        resultado=$((num1 * num2))
        echo "✅ $num1 * $num2 = $resultado"
        ;;
    "/")
        if [ $num2 -eq 0 ]; then
            echo "❌ Error: No se puede dividir por cero"
        else
            resultado=$((num1 / num2))
            echo "✅ $num1 / $num2 = $resultado"
        fi
        ;;
    *)
        echo "❌ Operación '$operacion' no válida"
        echo "💡 Operaciones permitidas: + - * /"
        ;;
esac