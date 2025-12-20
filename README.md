# DockerInfo

Script simple y visual para mostrar información de Docker en tu terminal.

## Características

- Muestra imágenes Docker
- Contenedores activos y detenidos
- Volúmenes
- Redes
- Salida con colores
- Tres modos: normal, compacto y JSON

## Instalación

```bash
git clone https://github.com/santimartinezzgb/dockerinfo.git
cd dockerinfo
chmod 744 dockerinfo.sh
```

## Uso

```bash
# Modo normal (por defecto)
./dockerinfo.sh

# Modo compacto
./dockerinfo.sh -c

# Salida JSON
./dockerinfo.sh -j

# Ver ayuda
./dockerinfo.sh -h
```

### Recomendación personal de uso

Copia y pega el siguiente fragmento en tu .bashrc

```bash
# INFORMACIÓN LOCAL DE DOCKER - Acceso rápido
dockerinfo() {
    ~/tu-ruta/dockerinfo/dockerinfo.sh "$@"
}
# Alias para acceso directo
alias di='dockerinfo'
alias dic='dockerinfo -c'
alias dij='dockerinfo -j'
```

Con esta implementación, el uso en terminal será:

```bash
dockerinfo      # o: di     - Modo normal
dockerinfo -c   # o: dic    - Modo compacto
dockerinfo -j   # o: dij    - Salida JSON
dockerinfo -h   #           - Ver ayuda
```

## Requisitos

- Docker instalado y ejecutándose
- Bash 4.0+
- Permisos para acceder a Docker


## Licencia

MIT License - ver archivo [LICENSE](LICENSE)

## Autor

**Santiago Martinez** - [@santimartinezzgb](https://github.com/santimartinezzgb)
This project is licensed under the MIT License. See the LICENSE
file for more details.
