#!/usr/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Actualizacion del sistema
sudo apt update
sudo apt full-upgrade -y

sudo snap refresh

# Instalacion de LXDE

sudo apt install -y lxde

mv $ruta/install.sh $ruta/install.sh.old
mv $ruta/install2.sh $ruta/install.sh

sudo reboot now