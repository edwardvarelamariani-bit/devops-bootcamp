#!/bin/bash

echo "=== FUNDAMENTOS DE BASH SCRIPTING ==="
echo

# 1. VARIABLES BÁSICAS
echo "1. 📝 VARIABLES BÁSICAS:"
echo "-----------------------"

NOMBRE="Ana García"
EDAD=28
CIUDAD="Madrid"
LENGUAJE_FAVORITO="BASH"

echo "   Hola, soy $NOMBRE"
echo "   Tengo $EDAD años y vivo en $CIUDAD"
echo "   Mi lenguaje favorito es $LENGUAJE_FAVORITO"
echo

# 2. VARIABLES DE ENTORNO
echo "2. 🌍 VARIABLES DE ENTORNO:"
echo "--------------------------"

echo "   Usuario: $USER"
echo "   Shell: $SHELL"
echo "   Home: $HOME"
echo "   Path: $PATH"
echo "   Directorio actual: $PWD"
echo

# 3. SUSTITUCIÓN DE COMANDOS
echo "3. 🔧 SUSTITUCIÓN DE COMANDOS:"
echo "-----------------------------"

FECHA_ACTUAL=$(date +"%Y-%m-%d %H:%M:%S")
HOSTNAME=$(hostname)
KERNEL=$(uname -r)
UPTIME=$(uptime -p 2>/dev/null || uptime)

echo "   Fecha actual: $FECHA_ACTUAL"
echo "   Hostname: $HOSTNAME"
echo "   Kernel: $KERNEL"
echo "   Uptime: $UPTIME"
echo

# 4. OPERACIONES CON VARIABLES
echo "4. 🧮 OPERACIONES CON VARIABLES:"
echo "------------------------------"

NUM1=15
NUM2=3

SUMA=$((NUM1 + NUM2))
RESTA=$((NUM1 - NUM2))
MULTIPLICACION=$((NUM1 * NUM2))
DIVISION=$((NUM1 / NUM2))

echo "   Números: $NUM1 y $NUM2"
echo "   Suma: $SUMA"
echo "   Resta: $RESTA"
echo "   Multiplicación: $MULTIPLICACION"
echo "   División: $DIVISION"
echo

# 5. ARRAYS
echo "5. 📚 ARRAYS:"
echo "------------"

FRUTAS=("Manzana" "Banana" "Naranja" "Uva")
echo "   Frutas: ${FRUTAS[@]}"
echo "   Primera fruta: ${FRUTAS[0]}"
echo "   Cantidad de frutas: ${#FRUTAS[@]}"
echo

# 6. ECHO CON FORMATOS
echo "6. 🎨 ECHO CON FORMATOS:"
echo "----------------------"

echo "   Texto normal"
echo -e "   Texto con \tsalto de línea y tabulación"
echo -e "   \033[1mTexto en negrita\033[0m"
echo -e "   \033[32mTexto en verde\033[0m"
echo -e "   \033[41mFondo rojo\033[0m"
echo

# 7. EJEMPLO PRÁCTICO: GENERADOR DE REPORTE
echo "7. 📊 GENERADOR DE REPORTE DEL SISTEMA:"
echo "-------------------------------------"

REPORTE_FILE="reporte_sistema_$(date +%Y%m%d_%H%M%S).txt"

{
    echo "=== REPORTE DEL SISTEMA ==="
    echo "Generado: $FECHA_ACTUAL"
    echo "Usuario: $USER"
    echo "Hostname: $HOSTNAME"
    echo "Sistema: $(uname -s)"
    echo "Kernel: $KERNEL"
    echo "Uptime: $UPTIME"
    echo "Directorio actual: $PWD"
    echo
    echo "=== ESPACIO EN DISCO ==="
    df -h | head -5
    echo
    echo "=== MEMORIA ==="
    free -h 2>/dev/null || echo "Comando 'free' no disponible en este sistema"
} > "$REPORTE_FILE"

echo "   ✅ Reporte generado: $REPORTE_FILE"
echo "   Tamaño del archivo: $(wc -l < "$REPORTE_FILE") líneas"
echo

# 8. BUENAS PRÁCTICAS DEMOSTRADAS
echo "8. ✅ BUENAS PRÁCTICAS:"
echo "---------------------"

echo "   • Variables en mayúsculas"
echo "   • Uso de comillas en strings"
echo "   • Sustitución de comandos con \$()"
echo "   • Redirección de output"
echo "   • Códigos de escape para colores"
echo "   • Manejo de errores silenciosos"