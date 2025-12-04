#!/bin/bash

echo "🌍 SELECTOR DE IDIOMA"
echo "===================="

read -p "Elige idioma (es/en/fr): " idioma

case $idioma in
    "es" | "ES" | "esp" | "Español")
        echo "¡Hola! Bienvenido al sistema."
        ;;
    "en" | "EN" | "eng" | "English") 
        echo "Hello! Welcome to the system."
        ;;
    "fr" | "FR" | "fra" | "Français")
        echo "Bonjour! Bienvenue dans le système."
        ;;
    *)
        echo "Idioma no soportado. Usando Español por defecto."
        echo "¡Hola! Bienvenido al sistema."
        ;;
esac
