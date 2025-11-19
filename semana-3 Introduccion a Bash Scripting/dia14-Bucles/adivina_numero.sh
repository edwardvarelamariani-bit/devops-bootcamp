#!/bin/bash

echo "🎮 JUEGO: ADIVINA EL NÚMERO"
echo "=========================="

# Generar número aleatorio entre 1 y 10
numero_secreto=$(( (RANDOM % 10) + 1 ))
intentos=0
max_intentos=5

echo "💡 He pensado un número entre 1 y 10"
echo "🎯 Tienes $max_intentos intentos para adivinarlo"
echo ""

while [ $intentos -lt $max_intentos ]; do
    intentos_restantes=$((max_intentos - intentos))
    echo "Intentos restantes: $intentos_restantes"
    
    read -p "¿Cuál crees que es el número? " respuesta
    
    # Verificar si es un número
    if ! [[ "$respuesta" =~ ^[0-9]+$ ]]; then
        echo "❌ Por favor, introduce un número válido"
        echo ""
        continue
    fi
    
    # Incrementar contador de intentos
    intentos=$((intentos + 1))
    
    # Verificar el número
    if [ $respuesta -eq $numero_secreto ]; then
        echo ""
        echo "🎉 ¡FELICIDADES! ¡Adivinaste!"
        echo "✅ Número correcto: $numero_secreto"
        echo "🏆 Lo lograste en $intentos intento(s)"
        break
    elif [ $respuesta -lt $numero_secreto ]; then
        echo "📈 El número es MAYOR que $respuesta"
    else
        echo "📉 El número es MENOR que $respuesta"
    fi
    
    echo ""
    
    # Si se acabaron los intentos
    if [ $intentos -eq $max_intentos ]; then
        echo "💀 ¡GAME OVER! Se te acabaron los intentos"
        echo "🔮 El número secreto era: $numero_secreto"
        echo "💡 ¡Inténtalo de nuevo!"
    fi
done
