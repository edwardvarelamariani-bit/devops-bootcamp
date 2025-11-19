#!/bin/bash

echo "=== HERRAMIENTAS DE DESCARGA WEB ==="
echo

# Función para mostrar uso
mostrar_uso() {
    echo "Uso: $0 [url]"
    echo "Ejemplos:"
    echo "  $0 https://www.ejemplo.com"
    echo "  $0 --headers https://www.ejemplo.com"
    echo "  $0 --descargar https://www.ejemplo.com/archivo.zip"
}

# Verificar si curl está instalado
if ! command -v curl &> /dev/null; then
    echo "❌ curl no está instalado. Instálalo con:"
    if [[ "$(uname)" == "Linux" ]]; then
        echo "sudo apt install curl"
    else
        echo "brew install curl"
    fi
    exit 1
fi

# Caso 1: Solo headers
if [ "$1" = "--headers" ] || [ "$1" = "-h" ]; then
    if [ -z "$2" ]; then
        echo "❌ Debes proporcionar una URL"
        mostrar_uso
        exit 1
    fi
    echo "📋 HEADERS HTTP de: $2"
    echo "========================"
    curl -I -L "$2"
    
# Caso 2: Descargar archivo
elif [ "$1" = "--descargar" ] || [ "$1" = "-d" ]; then
    if [ -z "$2" ]; then
        echo "❌ Debes proporcionar una URL"
        mostrar_uso
        exit 1
    fi
    echo "📥 DESCARGANDO: $2"
    echo "=================="
    wget "$2" || curl -O "$2"
    
# Caso 3: Probar una URL
elif [ -n "$1" ]; then
    URL="$1"
    echo "🔍 ANALIZANDO: $URL"
    echo "=================="
    
    # Probar con curl
    echo "1. Contenido básico (primeras 10 líneas):"
    echo "-----------------------------------------"
    curl -s "$URL" | head -10
    echo
    
    # Headers
    echo "2. Headers de respuesta:"
    echo "-----------------------"
    curl -I -s "$URL" | head -15
    echo
    
    # Tiempo de respuesta
    echo "3. Tiempo de respuesta:"
    echo "----------------------"
    time curl -s -o /dev/null -w "Código HTTP: %{http_code}\nTiempo total: %{time_total}s\n" "$URL"
    
else
    # Modo interactivo
    echo "Selecciona una opción:"
    echo "1) Ver headers de una URL"
    echo "2) Descargar archivo"
    echo "3) Analizar URL completa"
    echo "4) Probar APIs públicas"
    echo
    read -p "Opción (1-4): " opcion
    
    case $opcion in
        1)
            read -p "URL: " url
            echo "📋 Headers de: $url"
            curl -I -L "$url"
            ;;
        2)
            read -p "URL del archivo: " url
            echo "📥 Descargando..."
            wget "$url" || curl -O "$url"
            ;;
        3)
            read -p "URL: " url
            echo "🔍 Analizando: $url"
            curl -I -s "$url" && echo && echo "Contenido (primeras 5 líneas):" && curl -s "$url" | head -5
            ;;
        4)
            echo "🌍 Probando APIs públicas:"
            echo "a) httpbin.org/ip (tu IP)"
            echo "b) api.github.com/users/octocat"
            echo "c) jsonplaceholder.typicode.com/posts/1"
            read -p "Selecciona (a/b/c): " api_opcion
            
            case $api_opcion in
                a) curl -s https://httpbin.org/ip ;;
                b) curl -s https://api.github.com/users/octocat | head -20 ;;
                c) curl -s https://jsonplaceholder.typicode.com/posts/1 ;;
                *) echo "Opción inválida" ;;
            esac
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
fi

