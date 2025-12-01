# Script Bash de Información de Docker para _LINUX_

Este es un script Bash simple que muestra información clave de Docker en tu sistema:

- 📦 Imágenes de Docker  
- ▶️ Contenedores en ejecución  
- 📋 Todos los contenedores (en ejecución y detenidos)

## Requisitos

- Docker instalado y en ejecución  
- Shell Bash (probado con Bash 4+)

## Qué Hace

El script muestra:

1. **Todas las imágenes de Docker** (`docker images`)
2. **Contenedores en ejecución** (`docker ps`)
3. **Todos los contenedores** (`docker ps -a`)

## Cómo Usarlo

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/santimartinezzgb/dockerinfo.git
   cd dockerinfo
   ```
2. **Hacer el script ejecutable**

```bash
chmod +x dockerinfo.sh
```

3. **Ejecutar el script**

```bash
./dockerinfo.sh
```

4. **Crear un "acceso directo"**
   
   Crear en .bashrc un método para poder acceder a la información que proporciona este comando desde cualquier directorio.
   ```bash
   dockerinfo() {
    local script_dir="tu-ruta/dockerinfo"
    if [[ -x "$script_dir/dockerinfo.sh" ]]; then
        "$script_dir/dockerinfo.sh"
    else
        echo "Error: no se puede ejecutar $script_dir/dockerinfo.sh"
    fi
   }
   ```
   

## Autor
Santi Martínez

### Linkedin
https://www.linkedin.com/in/santiago-mart%C3%ADnez-gonz%C3%A1lez-besada-bb6467335/


