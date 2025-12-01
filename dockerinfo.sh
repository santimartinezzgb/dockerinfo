#!/bin/bash

# Comprobar si docker está instalado y accesible
if ! command -v docker &> /dev/null; then
    echo -e "\e[31mError: Docker no está instalado o no está en el PATH.\e[0m"
    exit 1
fi

# Comprobar si docker está corriendo
if ! docker info &> /dev/null; then
    echo -e "\e[31mError: El demonio de Docker no está corriendo o tu usuario no tiene permisos.\e[0m"
    exit 1
fi

images=$(docker images)
nimages=$(docker images | tail -n +2 | wc -l)

containerON=$(docker ps)
ncontainerON=$(docker ps | tail -n +2 | wc -l)

containerALL=$(docker ps -a)
ncontainerALL=$(docker ps -a | tail -n +2 | wc -l)

echo -e "\e[32m$nimages imágenes encontradas:"
echo -e "\e[0m$images\n"

echo -e "\e[32m$ncontainerON contenedores activos:"
echo -e "\e[0m$containerON\n"

echo -e "\e[32m$ncontainerALL contenedores en total:"
echo -e "\e[0m$containerALL\n"

echo -e "\e[32mPara ver los volúmenes:\e[0m docker volume ls"
