#!/usr/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Actualizando el sistema

sudo apt update

sudo apt upgrade -y

# Instalando dependencias del entorno

sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

# Instalando Requerimientos para la polybar

sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev

# Dependencias de Picom

sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# Instalamos paquetes adionales

sudo apt install -y feh scrot scrub zsh rofi xclip bat locate neofetch wmname acpi bspwm sxhkd imagemagick ranger kitty

## Instalacion de paquetes necesarios para el laboratorio

# Base

sudo apt install -y --no-install-recommends apt-utils apt-transport-https ca-certificates gnupg-agent software-properties-common unzip curl wget tmux preload gpm mc virt-what nano grep firefox iputils-ping net-tools less openssl bash-completion libssl3

# Ansible

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

# Docker and docker compose

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker
    
sudo apt install -y docker-compose

# Evince

sudo apt install -y evince

# Lynis

sudo apt install -y gnupg
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -

echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list
sudo apt update

sudo apt install -y lynis

# Nmap

sudo apt install -y nmap

# Oscap Tools

sudo apt install -y libopenscap8 asciidoc libpolkit-agent-1-0 build-essential openssh-client libopenscap-dev libqt5xmlpatterns5-dev ssh-askpass

cd $ruta

git clone https://github.com/OpenSCAP/scap-workbench.git

cd scap-workbench

mkdir build
cd build
cmake ../
make
sudo make install

# Python

sudo apt install -y python3 python3-pip

# Vscode

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update

sudo apt install -y code

## 

# Instalacion de otros paquetes

sudo apt install -y neofetch dkms open-vm-tools open-vm-tools-desktop firejail ubuntu-report

# Instalacion BurpSuiteCommunity

cd $ruta
wget "https://portswigger.net/burp/releases/startdownload?product=community&version=2023.12.1.3&type=Linux" -O burp.sh

echo "Instalar BurpSuite en ~/.BurpSuiteCommunity"
chmod u+x $ruta/burp.sh
$ruta/burp.sh

cd /bin

sudo ln -s ~/.BurpSuiteCommunity/BurpSuiteCommunity burpsuite

# Creando carpeta de Reposistorios

mkdir ~/github

# Descargar Repositorios Necesarios

cd ~/github
git clone --recursive https://github.com/polybar/polybar
git clone https://github.com/ibhagwan/picom.git

# Instalando Polybar

cd ~/github/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# Instalando Picom

cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# Configuramos el tema Nord de Rofi:

mkdir -p ~/.config/rofi/themes
cp $ruta/dotfiles/rofi/nord.rasi ~/.config/rofi/themes/

# Instando lsd

sudo apt install lsd

# Instalamos las HackNerdFonts

sudo cp -v $ruta/fonts/* /usr/local/share/fonts/

# Instalando Fuentes de Polybar

sudo cp -v $ruta/dotfiles/polybar/fonts/* /usr/share/fonts/truetype/

# Instalando Wallpaper de S4vitar

mkdir ~/Wallpaper
cp -v $ruta/Wallpaper/* ~/Wallpaper
mkdir ~/ScreenShots

# Copiando Archivos de Configuración

cp -rv $ruta/dotfiles/bin ~/.config/
cp -rv $ruta/dotfiles/bspwm ~/.config/
cp -rv $ruta/dotfiles/kitty ~/.config/
cp -rv $ruta/dotfiles/picom ~/.config/
cp -rv $ruta/dotfiles/polybar ~/.config/
cp -rv $ruta/dotfiles/sxhkd ~/.config/

cp -v $ruta/dotfiles/.nanorc ~/.nanorc

sudo cp -rv $ruta/kitty /opt/

chmod u+x ~/.config/polybar/scripts/*

# Kitty Root

sudo cp -rv $ruta/dotfiles/kitty /root/.config/

# Copia de configuracion de .p10k.zsh y .zshrc

rm -rf ~/.zshrc
cp -v $ruta/dotfiles/shells/.zshrc ~/.zshrc
cp -v $ruta/dotfiles/shells/.bashrc ~/.bashrc

cp -v $ruta/dotfiles/powerlevel10k/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/dotfiles/powerlevel10k/.p10k.zsh-root /root/.p10k.zsh

# Script

sudo cp -v $ruta/scripts/whichSystem.py /usr/local/bin/
sudo cp -v $ruta/scripts/screenshot /usr/local/bin/

mkdir ~/scripts

cp -v $ruta/scripts/clean_apt.sh ~/scripts
cp -v $ruta/scripts/disable_telemetry.sh ~/scripts
cp -v $ruta/scripts/set_timezone.sh ~/scripts

chmod u+x ~/scripts/*

~/scripts/disable_telemetry.sh
~/scripts/set_timezone.sh

# Plugins ZSH

sudo mkdir /usr/share/zsh-syntax-highlighting
sudo mkdir /usr/share/zsh-autosuggestions

cd /usr/share/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting

sudo cp -v zsh-syntax-highlighting.zsh ..
sudo cp -v .version ..
sudo cp -v .revision-hash ..
sudo cp -rv highlighters ..

cd ..
sudo rm -rf zsh-syntax-highlighting

cd /usr/share/zsh-autosuggestions
sudo wget https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh


sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Cambiando de SHELL a zsh

chsh -s /usr/bin/zsh
sudo usermod --shell /usr/bin/zsh root
sudo ln -s -fv ~/.zshrc /root/.zshrc

# Asignamos Permisos a los Scritps

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/htb_target.sh
chmod +x ~/.config/polybar/launch.sh
sudo chmod +x /usr/local/bin/whichSystem.py
sudo chmod +x /usr/local/bin/screenshot

# Configuramos el Tema de Rofi

rofi-theme-selector

# Movemos elementos extra

mkdir ~/other
cp -v $ruta/ubuntucheatsheet.jpg ~/other

# Copiar el MOTD

sudo cp -v $ruta/motd /etc/motd

# Copiar los materiales de clase

cp -rv $ruta/ssi_lab ~/ssi_lab

# Copiar dotfiles de pcmanfm

mkdir ~/.config/pcmanfm/LXDE
mkdir ~/.config/pcmanfm/default

cp -v $ruta/dotfiles/pcmanfm/desktop-items-0.conf ~/.config/pcmanfm/LXDE
cp -v $ruta/dotfiles/pcmanfm.conf ~/.config/pcmanfm/default

sudo apt install -y net-tools

# Removiendo Repositorio

rm -rf ~/github
rm -rf $ruta

# Mensaje de Instalado

echo "BSPWM INSTALADO"
echo "Por favor reiniciar"


# FIXME
# No funciona win + enter para abrir consola