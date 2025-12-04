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
chmod +x dockerinfo.sh
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
