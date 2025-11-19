#!/bin/bash

echo "📊 MONITOR DEL SISTEMA AVANZADO"
echo "=============================="
echo "Fecha: $(date)"
echo "Usuario: $(whoami)"
echo

# 1. VERIFICAR ESPACIO EN DISCO
echo "💾 ESPACIO EN DISCO:"
echo "-------------------"

# Umbral de alerta (80%)
UMBRAL_DISCO=80

# Obtener uso de disco raíz
if [[ "$(uname)" == "Linux" ]]; then
    ESPACIO=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    DISCO_INFO=$(df -h / | tail -1)
elif [[ "$(uname)" == "Darwin" ]]; then
    ESPACIO=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    DISCO_INFO=$(df -h / | tail -1)
else
    ESPACIO=0
    DISCO_INFO="Sistema no compatible"
fi

echo "   Uso de disco raíz: $ESPACIO%"

if [ $ESPACIO -gt $UMBRAL_DISCO ]; then
    echo "   ⚠️  ALERTA: Espacio en disco crítico (>$UMBRAL_DISCO%)"
    echo "   💡 Recomendación: Limpia archivos temporales"
else
    echo "   ✅ Espacio en disco OK"
fi

echo "   Información: $DISCO_INFO"
echo

# 2. VERIFICAR MEMORIA
echo "🧠 MEMORIA RAM:"
echo "--------------"

if [[ "$(uname)" == "Linux" ]]; then
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}')
    MEM_USADA=$(free -m | grep Mem | awk '{print $3}')
    MEM_LIBRE=$(free -m | grep Mem | awk '{print $4}')
    MEM_PORCENTAJE=$((MEM_USADA * 100 / MEM_TOTAL))
    
    echo "   Total: ${MEM_TOTAL}MB"
    echo "   Usada: ${MEM_USADA}MB"
    echo "   Libre: ${MEM_LIBRE}MB"
    echo "   Uso: $MEM_PORCENTAJE%"
    
    if [ $MEM_LIBRE -lt 100 ]; then
        echo "   ⚠️  ALERTA: Poca memoria libre (<100MB)"
    else
        echo "   ✅ Memoria OK"
    fi
    
elif [[ "$(uname)" == "Darwin" ]]; then
    MEM_INFO=$(vm_stat | grep -E "(free|active|inactive)" | head -3)
    echo "   Información memoria macOS:"
    echo "$MEM_INFO" | while read line; do
        echo "   - $line"
    done
else
    echo "   ❓ Sistema no compatible para info de memoria"
fi
echo

# 3. VERIFICAR CARGA DEL SISTEMA
echo "⚡ CARGA DEL SISTEMA:"
echo "-------------------"

if [[ "$(uname)" == "Linux" ]]; then
    LOAD_AVG=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    CPU_CORES=$(nproc)
    
    echo "   Load Average: $LOAD_AVG"
    echo "   Núcleos CPU: $CPU_CORES"
    
    # Calcular carga normalizada (load average / núcleos)
    LOAD_NORMALIZED=$(echo "$LOAD_AVG" | awk -v cores=$CPU_CORES '{print $1/cores}')
    
    if (( $(echo "$LOAD_NORMALIZED > 1.0" | bc -l) )); then
        echo "   ⚠️  ALERTA: Carga del sistema alta"
    else
        echo "   ✅ Carga del sistema OK"
    fi
    
elif [[ "$(uname)" == "Darwin" ]]; then
    LOAD_AVG=$(sysctl -n vm.loadavg | awk '{print $2, $3, $4}')
    CPU_CORES=$(sysctl -n hw.ncpu)
    
    echo "   Load Average: $LOAD_AVG"
    echo "   Núcleos CPU: $CPU_CORES"
else
    echo "   ❓ Sistema no compatible para info de carga"
fi
echo

# 4. VERIFICAR CONECTIVIDAD A INTERNET
echo "🌐 CONECTIVIDAD A INTERNET:"
echo "--------------------------"

# Probar conectividad básica
if ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    echo "   ✅ Conectado a internet"
    
    # Intentar obtener IP pública (con timeout)
    IP_PUBLICA=$(curl -s --max-time 3 ifconfig.me)
    if [ -n "$IP_PUBLICA" ]; then
        echo "   📡 IP Pública: $IP_PUBLICA"
    else
        echo "   📡 IP Pública: No disponible"
    fi
else
    echo "   ❌ Sin conexión a internet"
fi

# Verificar DNS
if nslookup google.com &> /dev/null; then
    echo "   ✅ DNS funcionando correctamente"
else
    echo "   ❌ Problemas con DNS"
fi
echo

# 5. VERIFICAR SERVICIOS ESCUCHANDO
echo "🔊 PUERTOS Y SERVICIOS:"
echo "----------------------"

if command -v ss &> /dev/null; then
    # Linux con ss
    echo "   Puertos escuchando (primeros 5):"
    ss -tulpn | head -6
elif command -v netstat &> /dev/null; then
    # macOS o Linux con netstat
    echo "   Puertos escuchando (primeros 5):"
    netstat -tuln | head -6
else
    echo "   ❓ No se puede verificar puertos (comando no disponible)"
fi
echo

# 6. VERIFICAR TEMPERATURA (solo Linux)
echo "🌡️  INFORMACIÓN DE TEMPERATURA:"
echo "-----------------------------"

if [[ "$(uname)" == "Linux" ]]; then
    if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        TEMP_RAW=$(cat /sys/class/thermal/thermal_zone0/temp)
        TEMP_C=$((TEMP_RAW / 1000))
        echo "   Temperatura CPU: ${TEMP_C}°C"
        
        if [ $TEMP_C -gt 70 ]; then
            echo "   ⚠️  ALERTA: Temperatura alta"
        elif [ $TEMP_C -gt 50 ]; then
            echo "   ℹ️  Temperatura normal"
        else
            echo "   ✅ Temperatura OK"
        fi
    else
        echo "   ❓ Sensor de temperatura no disponible"
    fi
else
    echo "   ❓ Información de temperatura no disponible en macOS"
fi
echo

# 7. RESUMEN Y RECOMENDACIONES
echo "📋 RESUMEN DEL SISTEMA:"
echo "----------------------"

# Contar alertas
ALERTAS=0

if [ $ESPACIO -gt $UMBRAL_DISCO ]; then
    ALERTAS=$((ALERTAS + 1))
fi

if [[ "$(uname)" == "Linux" ]] && [ $MEM_LIBRE -lt 100 ]; then
    ALERTAS=$((ALERTAS + 1))
fi

if ! ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    ALERTAS=$((ALERTAS + 1))
fi

echo "   Estado general del sistema:"
if [ $ALERTAS -eq 0 ]; then
    echo "   🟢 EXCELENTE - Todo funciona correctamente"
elif [ $ALERTAS -eq 1 ]; then
    echo "   🟡 BUENO - Un área necesita atención"
else
    echo "   🔢 REGULAR - $ALERTAS áreas necesitan atención"
fi

echo
echo "💡 RECOMENDACIONES:"
if [ $ESPACIO -gt $UMBRAL_DISCO ]; then
    echo "   - Limpia archivos temporales y caché"
fi

if [[ "$(uname)" == "Linux" ]] && [ $MEM_LIBRE -lt 100 ]; then
    echo "   - Cierra aplicaciones que no uses"
    echo "   - Considera añadir más memoria RAM"
fi

if ! ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    echo "   - Verifica tu conexión a internet"
    echo "   - Revisa configuración de red"
fi

echo
echo "🔍 Para más detalles ejecuta:"
echo "   df -h          # Espacio en disco detallado"
echo "   free -h        # Memoria detallada"
echo "   top            # Procesos en tiempo real"
echo "   ip a           # Interfaces de red"

echo
echo "✅ Monitoreo completado a las: $(date +%H:%M:%S)"