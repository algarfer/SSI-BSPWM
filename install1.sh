#!/usr/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

# Actualizacion del sistema
sudo apt update
sudo apt full-upgrade -y

sudo snap refresh

# Instalacion de LXDE

sudo apt install -y lxde 

sudo reboot now