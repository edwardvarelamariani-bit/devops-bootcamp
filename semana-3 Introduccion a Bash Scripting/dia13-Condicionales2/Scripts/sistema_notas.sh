#!/bin/bash

echo "🎓 SISTEMA DE CALIFICACIONES"
echo "==========================="

read -p "Introduce la nota (0-100): " nota

case $nota in
    9[0-9]|100)
        echo "✅ Calificación: A (Excelente)"
        ;;
    8[0-9])
        echo "👍 Calificación: B (Muy Bueno)" 
        ;;
    7[0-9])
        echo "👌 Calificación: C (Bueno)"
        ;;
    6[0-9])
        echo "⚠️  Calificación: D (Aprobado)"
        ;;
    [0-9]|[1-5][0-9])
        echo "❌ Calificación: F (Reprobado)"
        echo "💡 Necesitas estudiar más"
        ;;
    *)
        echo "❌ Error: La nota debe ser entre 0 y 100"
        ;;
esac
