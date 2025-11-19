#!/bin/bash
# Práctica de terminación de procesos
# Uso: ./practica_kill.sh

echo "=== 💀 PRÁCTICA DE COMANDO KILL ==="
echo ""

# Crear proceso temporal
echo "🔄 Creando proceso temporal..."
sleep 300 &
PROCESO_PID=$!

echo "🆔 PID del proceso: $PROCESO_PID"

# Verificar que está vivo
if ps -p $PROCESO_PID > /dev/null 2>&1; then
    echo "✅ Proceso creado exitosamente"
else
    echo "❌ Error creando proceso"
    exit 1
fi

echo ""
echo "=== 🧪 SEÑALES DE TERMINACIÓN ==="

echo "1. 🟢 Terminación normal (SIGTERM - 15):"
kill $PROCESO_PID
sleep 2
if ps -p $PROCESO_PID >/dev/null 2>&1; then
    echo "   ❌ Aún vivo - probando método más fuerte..."
    kill -15 $PROCESO_PID
    sleep 2
fi

if ps -p $PROCESO_PID >/dev/null 2>&1; then
    echo "   ⚠️  Resistente - necesitamos fuerza..."
else
    echo "   ✅ Terminado exitosamente"
fi

echo ""
echo "2. 🔴 Terminación forzada (SIGKILL - 9):"
echo "   Creando nuevo proceso resistente..."
sleep 600 &
PROCESO_PID2=$!
echo "   Nuevo PID: $PROCESO_PID2"

echo "   Ejecutando terminación forzada..."
kill -9 $PROCESO_PID2
sleep 2

if ps -p $PROCESO_PID2 >/dev/null 2>&1; then
    echo "   ❌ ¡INCREÍBLE! El proceso sobrevivió a SIGKILL"
else
    echo "   ✅ Terminado forzadamente"
fi

echo ""
echo "=== 📚 RESUMEN DE SEÑALES ==="
echo "SIGTERM (15) - Terminación amable: kill PID"
echo "SIGKILL (9)  - Terminación forzada: kill -9 PID"
echo "SIGSTOP (19) - Suspender proceso: kill -STOP PID"
echo "SIGCONT (18) - Reanudar proceso: kill -CONT PID"

echo ""
echo "🎉 Práctica de kill completada"
