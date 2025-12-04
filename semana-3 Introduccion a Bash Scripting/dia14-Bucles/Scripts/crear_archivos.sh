#!/bin/bash

echo "📁 CREANDO ARCHIVOS CON BUCLE FOR"
echo "================================"

# Ejemplo 1: Crear archivos numerados
echo "1. Creando archivos del 1 al 5..."
for i in 1 2 3 4 5; do
    touch "archivo$i.txt"
    echo "   ✅ Creado: archivo$i.txt"
done

echo "📁 CREANDO ARCHIVOS CON BUCLE FOR"
echo "================================"

# Ejemplo 1: Crear archivos numerados
echo "1. Creando archivos del 1 al 5..."
for i in 1 2 3 4 5; do
    touch "archivo$i.txt"
    echo "   ✅ Creado: archivo$i.txt"
done

# Ejemplo 2: Crear archivos con patrones
echo ""
echo "2. Creando archivos de reportes..."
for dia in lunes martes miercoles jueves viernes; do
    touch "reporte_${dia}.log"
    echo "   ✅ Creado: reporte_${dia}.log"
done

# Ejemplo 3: Usando rangos
echo ""
echo "3. Creando backups..."
for numero in {1..3}; do
    touch "backup_v${numero}.tar.gz"
    echo "   ✅ Creado: backup_v${numero}.tar.gz"
done

# Mostrar resultado
echo ""
echo "📋 ARCHIVOS CREADOS:"
ls -la *.txt *.log *.tar.gz 2>/dev/null
