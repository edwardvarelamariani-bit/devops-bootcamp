 de Linux, Bash, gestión de procesos y análisis de logs.

## 📚 Contenido

### Semana 1: Fundamentos de Linux y Bash
- **Día 1**: Navegación y comandos básicos
- **Día 2**: Creación y manejo de archivos  
- **Día 3**: Organización y gestión de archivos
- **Días 4-5**: Permisos y superusuario (sudo)

### Semana 2: El Sistema en Acción
- **Día 6**: Gestión de procesos
- **Día 7**: Control de procesos (kill, signals)
- **Día 8**: Análisis de logs del sistema

## 🛠️ Scripts Incluidos

### 📁 semana-1/dia3-gestion/
- `organizador_archivos.sh` - Organiza archivos por tipo automáticamente

### 📁 semana-1/dia45-permisos/
- `crear_estructura_segura.sh` - Crea estructura con diferentes niveles de permisos
- `script_universal.sh` - Script multi-plataforma (macOS/Linux)

### 📁 semana-2/dia6-procesos/
- `reporte_sistema.sh` - Genera reporte completo de procesos del sistema
- `detector_sistema.sh` - Detecta y muestra información del sistema operativo

### 📁 semana-2/dia7-control/
- `administrador_procesos.sh` - Demostración de control de procesos
- `practica_kill.sh` - Práctica de señales y terminación de procesos

### 📁 seman
## 🚀 Como Usar

```bash
# Hacer los scripts ejecutables
chmod +x *.sh

# Ejecutar cualquier script
./nombre_del_script.sh
# 🚀 DevOps Bootcamp - Journey Completo (Semanas 1-4)

Scripts y ejercicios prácticos de un curso intensivo de DevOps covering fundamentos de Linux, Bash, gestión de procesos, redes y scripting automatizado.

## 📚 Contenido

### ✅ Semana 1: Fundamentos de Linux y Bash
- **Día 1**: Navegación y comandos básicos
- **Día 2**: Creación y manejo de archivos  
- **Día 3**: Organización y gestión de archivos
- **Días 4-5**: Permisos y superusuario (sudo)

### ✅ Semana 2: El Sistema en Acción
- **Día 6**: Gestión de procesos
- **Día 7**: Control de procesos (kill, signals)
- **Día 8**: Análisis de logs del sistema
- **Día 9**: 🔌 Redes I - Diagnóstico de conectividad
- **Día 10**: 🌐 Redes II - Transferencia de datos web

### 🚧 Semana 3: Bash Scripting (En Progreso)
- **Día 11**: 📝 BASH Basics - Variables y sustitución de comandos
- **Día 12**: 🤔 Condicionales I - Tomar decisiones con `if`
- **Día 13**: 🔄 Condicionales II - Estructuras `case` 
- **Día 14**: 🔁 Bucles - Automatización con `for` y `while`
- **Día 15**: 💾 Primer script útil - Sistema de backup

### 📋 Semana 4: Integración y Proyecto Final
- **Día 16**: 🎩 Pipes y Redirecciones
- **Día 17**: 🔍 Filtros de Texto I - `grep` y `awk`
- **Día 18**: ✂️ Filtros de Texto II - El poder de `sed`
- **Día 19**: ⏰ Programando Tareas - Cron y automatización
- **Día 20**: 🏆 Proyecto Final Integrador

## 🛠️ Scripts Incluidos

### 📁 semana-1/
- **dia3-gestion/**
  - `organizador_archivos.sh` - Organiza archivos por tipo automáticamente
- **dia45-permisos/**
  - `crear_estructura_segura.sh` - Crea estructura con diferentes niveles de permisos
  - `script_universal.sh` - Script multi-plataforma (macOS/Linux)

### 📁 semana-2/
- **dia6-procesos/**
  - `reporte_sistema.sh` - Genera reporte completo de procesos del sistema
  - `detector_sistema.sh` - Detecta y muestra información del sistema operativo
- **dia7-control/**
  - `administrador_procesos.sh` - Demostración de control de procesos
  - `practica_kill.sh` - Práctica de señales y terminación de procesos
- **dia8-logs/**
  - `log_generator.sh` - Genera logs de prueba para análisis
  - `analizador_logs.sh` - Analiza y muestra estadísticas de logs
- **dia9-redes-1/**
  - `redes_basicas.sh` - 🔌 Diagnóstico completo de conectividad de red
- **dia10-redes-2/**
  - `descargas_web.sh` - 🌐 Herramientas multipropósito para transferencia web

### 📁 semana-3/ 
- **dia11-bash-basics/**
  - `bash_basics.sh` - 📝 Fundamentos esenciales de variables y echo
- **dia12-condicionales-1/**
  - `verificar_archivo.sh` - 🤔 Verifica existencia y permisos de archivos
  - `verificar_variable.sh` - 🔍 Valida el estado de variables
  - `monitor_sistema.sh` - 📊 Monitor avanzado con condicionales

## 🚀 Como Usar

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/devops-bootcamp.git
cd devops-bootcamp

# Hacer los scripts ejecutables
find . -name "*.sh" -exec chmod +x {} \;

# Ejecutar cualquier script
./semana-2/dia9-redes-1/redes_basicas.sh
./semana-3/dia11-bash-basics/bash_basics.sh
