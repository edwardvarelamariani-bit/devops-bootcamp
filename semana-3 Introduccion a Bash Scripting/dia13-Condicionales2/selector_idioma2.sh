#!/bin/bash

while true; do
    clear
    echo "🌍 SELECTOR DE IDIOMA"
    echo "===================="
    echo "Idiomas disponibles: es / en / fr"
    echo

    read -p "Elige idioma: " idioma

    case $idioma in
        "es" | "ES" | "esp" | "Español")
            echo "¡Hola! Bienvenido al sistema."
            break
            ;;
        "en" | "EN" | "eng" | "English")
            echo "Hello! Welcome to the system."
            break
            ;;
        "fr" | "FR" | "fra" | "Français")
            echo "Bonjour! Bienvenue dans le système."
            break
            ;;
        *)
            echo "Idioma no soportado."
            read -p "¿Desea continuar? (si/no): " continuar
            case $continuar in
                "si" | "sí" | "SI" | "Sí")
                    continue  # vuelve al principio del while
                    ;;
                "no" | "NO")
                    read -p "¿Está seguro que quiere salir? (si/no): " salir
                    case $salir in
                        "si" | "sí" | "SI" | "Sí")
                            echo "👋 Saliendo del sistema..."
                            exit 0
                            ;;
                        "no" | "NO")
                            continue  # vuelve al principio
                            ;;
                        *)
                            echo "Respuesta no válida. Volviendo al menú..."
                            sleep 1
                            continue
                            ;;
                    esac
                    ;;
                *)
                    echo "Respuesta no válida. Volviendo al menú..."
                    sleep 1
                    continue
                    ;;
            esac
            ;;
    esac
done
