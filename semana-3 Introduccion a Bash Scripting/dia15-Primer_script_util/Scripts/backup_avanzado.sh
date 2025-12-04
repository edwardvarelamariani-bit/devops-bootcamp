#!/bin/bash

echo "💾 BACKUP AVANZADO CONFIGURABLE"
echo "==============================="

# Configuración por defecto
CARPETA_ORIGEN="."
CARPETA_BACKUP="./backups"
EXTENSION="*.txt"
FECHA=$(date +%Y-%m-%d_%H-%M-%S)

# Función de ayuda
mostrar_ayuda() {
    echo "Uso: $0 [OPCIONES]"
    echo ""
    echo "OPCIONES:"
    echo "  -o, --origen DIR    Carpeta origen (default: .)"
    echo "  -d, --destino DIR   Carpeta destino (default: ./backups)"
    echo "  -e, --extension EXT Extensión de archivos (default: *.txt)"
    echo "  -h, --help          Mostrar esta ayuda"
    echo ""
    echo "EJEMPLOS:"
    echo "  $0 -o ~/documentos -e \"*.pdf\""
    echo "  $0 --origen /home/usuario --destino /backups --extension \"*.sh\""
}

# Procesar argumentos
while [ $# -gt 0 ]; do
    case $1 in
        -o|--origen)
            CARPETA_ORIGEN="$2"
            shift 2
            ;;
        -d|--destino)
            CARPETA_BACKUP="$2"
            shift 2
            ;;
        -e|--extension)
            EXTENSION="$2"
            shift 2
            ;;
        -h|--help)
            mostrar_ayuda
            exit 0
            ;;
        *)
            echo "❌ Error: Argumento desconocido '$1'"
            mostrar_ayuda
            exit 1
            ;;
    esac
done

# Verificar que la carpeta origen existe
if [ ! -d "$CARPETA_ORIGEN" ]; then
    echo "❌ Error: La carpeta origen '$CARPETA_ORIGEN' no existe"
    exit 1
fi

# Crear carpeta de backups
echo "📁 Creando carpeta de backups: $CARPETA_BACKUP"
mkdir -p "$CARPETA_BACKUP"

# Contar archivos
echo "🔍 Buscando archivos: $EXTENSION en $CARPETA_ORIGEN"
NUM_ARCHIVOS=$(find "$CARPETA_ORIGEN" -name "$EXTENSION" | wc -l)

if [ $NUM_ARCHIVOS -eq 0 ]; then
    echo "❌ No se encontraron archivos $EXTENSION"
    exit 1
fi

echo "📊 Encontrados $NUM_ARCHIVOS archivos"

# Crear nombre del backup
NOMBRE_BASE=$(basename "$CARPETA_ORIGEN")
NOMBRE_BACKUP="backup_${NOMBRE_BASE}_${FECHA}.tar.gz"

echo "🔄 Creando backup: $NOMBRE_BACKUP"

# Crear backup
if tar -czf "$CARPETA_BACKUP/$NOMBRE_BACKUP" -C "$CARPETA_ORIGEN" $EXTENSION 2>/dev/null; then
    echo "✅ Backup creado exitosamente!"
    echo ""
    echo "📋 RESUMEN:"
    echo "   📂 Origen: $CARPETA_ORIGEN"
    echo "   📁 Destino: $CARPETA_BACKUP/$NOMBRE_BACKUP"
    echo "   🔤 Extensión: $EXTENSION"
    echo "   📦 Tamaño: $(du -h "$CARPETA_BACKUP/$NOMBRE_BACKUP" | cut -f1)"
    echo "   📊 Archivos: $NUM_ARCHIVOS"
else
    echo "❌ Error al crear el backup"
    exit 1
fi

