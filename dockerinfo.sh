#!/bin/bash
#
# dockerinfo.sh v2.0.0
# Muestra información de Docker de forma visual
# https://github.com/santimartinezzgb/dockerinfo

VERSION="2.0.0"

# Colores
RED='\e[31m' GREEN='\e[32m' YELLOW='\e[33m' CYAN='\e[36m' RESET='\e[0m'

# Verificar Docker
if ! docker info &>/dev/null; then
    echo -e "${RED}Error: Docker no está disponible${RESET}" >&2
    exit 1
fi

# Mostrar ayuda
show_help() {
    cat << EOF
Uso: $0 [OPCIÓN]

Opciones:
  -c, --compact    Mostrar resumen compacto
  -j, --json       Salida en formato JSON
  -v, --version    Mostrar versión
  -h, --help       Mostrar esta ayuda
EOF
}

# Modo compacto
compact_mode() {
    local imgs=$(docker images -q | wc -l)
    local run=$(docker ps -q | wc -l)
    local all=$(docker ps -aq | wc -l)
    local vols=$(docker volume ls -q | wc -l)
    local nets=$(docker network ls -q | wc -l)
    
    echo -e "${CYAN}╔═══════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║${RESET}  ${GREEN}Resumen Docker${RESET}                   ${CYAN}║${RESET}"
    echo -e "${CYAN}╠═══════════════════════════════════╣${RESET}"
    echo -e "${CYAN}║${RESET} 📦 Imágenes:              ${YELLOW}$(printf "%7s" $imgs)${RESET} ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET} ▶️  Contenedores:          ${GREEN}$(printf "%7s" $run)${RESET} ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET} 📋 Total contenedores:    ${YELLOW}$(printf "%7s" $all)${RESET} ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET} 💾 Volúmenes:             ${YELLOW}$(printf "%7s" $vols)${RESET} ${CYAN}║${RESET}"
    echo -e "${CYAN}║${RESET} 🌐 Redes:                 ${YELLOW}$(printf "%7s" $nets)${RESET} ${CYAN}║${RESET}"
    echo -e "${CYAN}╚═══════════════════════════════════╝${RESET}"
}

# Modo JSON
json_mode() {
    local imgs=$(docker images -q | wc -l)
    local run=$(docker ps -q | wc -l)
    local all=$(docker ps -aq | wc -l)
    local vols=$(docker volume ls -q | wc -l)
    local nets=$(docker network ls -q | wc -l)
    
    cat << EOF
{
  "version": "$VERSION",
  "images": $imgs,
  "containers": {
    "running": $run,
    "total": $all
  },
  "volumes": $vols,
  "networks": $nets
}
EOF
}

# Modo normal
normal_mode() {
    local imgs=$(docker images -q | wc -l)
    local run=$(docker ps -q | wc -l)
    local all=$(docker ps -aq | wc -l)
    local vols=$(docker volume ls -q | wc -l)
    local nets=$(docker network ls -q | wc -l)
    
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}📦 IMÁGENES${RESET} (${YELLOW}$imgs${RESET})"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    [ $imgs -eq 0 ] && echo -e "${YELLOW}  Sin imágenes${RESET}" || docker images
    
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}▶️  CONTENEDORES ACTIVOS${RESET} (${YELLOW}$run${RESET})"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    [ $run -eq 0 ] && echo -e "${YELLOW}  Sin contenedores activos${RESET}" || docker ps
    
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}📋 TODOS LOS CONTENEDORES${RESET} (${YELLOW}$all${RESET})"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    [ $all -eq 0 ] && echo -e "${YELLOW}  Sin contenedores${RESET}" || docker ps -a
    
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}💾 VOLÚMENES${RESET} (${YELLOW}$vols${RESET})"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    [ $vols -eq 0 ] && echo -e "${YELLOW}  Sin volúmenes${RESET}" || docker volume ls
    
    echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}🌐 REDES${RESET} (${YELLOW}$nets${RESET})"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    [ $nets -eq 0 ] && echo -e "${YELLOW}  Sin redes${RESET}" || docker network ls
    echo ""
}

# Procesar argumentos
case "${1:-}" in
    -c|--compact) compact_mode ;;
    -j|--json) json_mode ;;
    -v|--version) echo "dockerinfo v$VERSION" ;;
    -h|--help) show_help ;;
    "") normal_mode ;;
    *) echo -e "${RED}Opción inválida: $1${RESET}\nUsa -h para ayuda" >&2; exit 1 ;;
esac
