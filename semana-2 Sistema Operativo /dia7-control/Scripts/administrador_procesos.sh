#!/bin/bash
# Script para gestionar procesos
# Uso: ./administrador_procesos.sh

echo "=== 🎮 ADMINISTRADOR DE PROCESOS ==="
echo ""

# Crear directorio de trabajo
mkdir -p /tmp/procesos_demo
cd /tmp/procesos_demo

echo "🔄 Creando procesos de prueba..."

# Crear procesos de prueba con nombres únicos
bash -c 'while true; do echo "PROCESO-A $(date +"%H:%M:%S")" >> proceso_a.log; sleep 10; done' &
bash -c 'while true; do echo "PROCESO-B $(date +"%H:%M:%S")" >> proceso_b.log; sleep 8; done' &

# Esperar que se inicien
sleep 2

echo ""
echo "=== 📋 PROCESOS ACTIVOS ==="
ps aux | grep "PROCESO-" | grep -v grep

# Obtener PIDs
PID_A=$(ps aux | grep "PROCESO-A" | grep -v grep | awk '{print $2}')
PID_B=$(ps aux | grep "PROCESO-B" | grep -v grep | awk '{print $2}')

echo ""
echo "🆔 PIDs identificados:"
echo "PID A: $PID_A"
echo "PID B: $PID_B"

echo ""
echo "=== 🧪 DEMOSTRACIÓN DE CONTROL ==="

echo "1. ⏸️  Suspender proceso B..."
kill -STOP $PID_B 2>/dev/null
sleep 5
echo "   Proceso B suspendido. Verifica que no escribe en proceso_b.log"

echo "2. ▶️  Reanudar proceso B..."
kill -CONT $PID_B 2>/dev/null
sleep 3
echo "   Proceso B reanudado"

echo "3. 💀 Terminar proceso A..."
kill $PID_A 2>/dev/null
sleep 2

echo "4. 🔍 Verificando estado..."
if ps -p $PID_A >/dev/null 2>&1; then
    echo "   ❌ Proceso A aún vivo"
else
    echo "   ✅ Proceso A terminado"
fi

if ps -p $PID_B >/dev/null 2>&1; then
    echo "   ✅ Proceso B aún vivo"
else
    echo "   ❌ Proceso B terminado"
fi

# Limpiar proceso B
kill $PID_B 2>/dev/null

echo ""
echo "=== 🧹 LIMPIEZA ==="
echo "Procesos restantes:"
ps aux | grep "PROCESO-" | grep -v grep | wc -l

echo ""
echo "🎉 Demostración completada"
