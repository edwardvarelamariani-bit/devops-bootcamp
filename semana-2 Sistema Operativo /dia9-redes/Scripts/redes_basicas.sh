#!/bin/bash

echo "=== DIAGNÓSTICO BÁSICO DE RED ==="
echo "Fecha: $(date)"
echo

# 1. Información de interfaces de red
echo "🔌 INTERFACES DE RED:"
echo "-------------------"
ip a | grep -E "^([0-9]+):|inet " | grep -v "127.0.0.1" | head -10
echo

# 2. Prueba de conectividad básica
echo "🌐 PRUEBAS DE CONECTIVIDAD:"
echo "-------------------------"

# Ping a DNS de Google
echo -n "Ping a 8.8.8.8 (DNS Google): "
if ping -c 2 -W 1 8.8.8.8 &> /dev/null; then
    echo "✅ CONECTADO"
else
    echo "❌ SIN CONEXIÓN"
fi

# Ping a Google.com (prueba DNS)
echo -n "Ping a google.com (DNS + Conexión): "
if ping -c 2 -W 1 google.com &> /dev/null; then
    echo "✅ CONECTADO"
else
    echo "❌ SIN CONEXIÓN - Posible problema DNS"
fi

# 3. Puertos escuchando
echo
echo "🔊 PUERTOS ESCUCHANDO:"
echo "---------------------"
ss -tulpn | head -15

# 4. Información de routing
echo
echo "🗺️  TABLA DE ROUTING:"
echo "-------------------"
ip route | head -10

# 5. Resumen
echo
echo "📊 RESUMEN:"
echo "----------"
if ping -c 1 -W 2 8.8.8.8 &> /dev/null; then
    echo "✅ Tienes conexión a internet"
    IP_PUBLICA=$(curl -s ifconfig.me)
    echo "   IP Pública: $IP_PUBLICA"
else
    echo "❌ No tienes conexión a internet"
fi
