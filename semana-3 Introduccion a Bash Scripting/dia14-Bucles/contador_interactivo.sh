#!/bin/bash

echo "🔢 CONTADOR INTERACTIVO"
echo "======================"

while true; do
    echo ""
    echo "Opciones:"
    echo "1) Contar del 1 al 5"
    echo "2) Contar del 1 al 10" 
    echo "3) Contar números pares del 1 al 10"
    echo "4) Contar descendente del 5 al 1"
    echo "5) Salir"
    echo ""
    
    read -p "Selecciona una opción (1-5): " opcion
    
    case $opcion in
        1)
            echo "➡️  Contando del 1 al 5:"
            for i in 1 2 3 4 5; do
                echo "   Número: $i"
            done
            ;;
        2)
            echo "➡️  Contando del 1 al 10:"
            for i in $(seq 1 10); do
                echo "   Número: $i"
            done
            ;;
        3)
            echo "➡️  Contando números pares del 1 al 10:"
            for i in 2 4 6 8 10; do
                echo "   Número par: $i"
            done
            ;;
        4)
            echo "⬅️  Contando descendente del 5 al 1:"
            for i in 5 4 3 2 1; do
                echo "   Número: $i"
            done
            ;;
        5)
            echo "👋 ¡Hasta pronto!"
            break
            ;;
        *)
            echo "❌ Opción no válida. Intenta de nuevo."
            ;;
    esac
    
    read -p "⏎ Presiona Enter para continuar..."
done
