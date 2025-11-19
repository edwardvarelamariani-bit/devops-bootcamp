#!/bin/bash

echo "👥 PROCESANDO LISTA DE USUARIOS"
echo "=============================="

# Lista de usuarios (podría venir de un archivo)
usuarios="ana carlos maria jose luis"

echo "Usuarios a procesar: $usuarios"
echo ""

# Contador
contador=1

for usuario in $usuarios; do
    echo "Usuario #$contador: $usuario"
    
    # Simular diferentes acciones basadas en el usuario
    case $usuario in
        "ana")
            echo "   👋 Hola Ana! Eres la administradora"
            ;;
        "carlos" | "maria")
            echo "   💼 Hola $usuario! Eres del equipo de desarrollo"
            ;;
        *)
            echo "   😊 Hola $usuario! Bienvenido/a"
            ;;
    esac
    
    # Crear directorio personal simulado
    echo "   📁 Creando directorio para $usuario..."
    mkdir -p "home_$usuario"
    
    # Incrementar contador
    contador=$((contador + 1))
    echo ""
done

echo "✅ Procesamiento completado: $((contador - 1)) usuarios"
echo "📂 Directorios creados:"
ls -d home_*/
