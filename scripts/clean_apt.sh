#!/bin/bash

echo ">>>>> Cleaning up apt <<<<<"
sudo apt-get -y --purge autoremove
sudo apt-get -y clean 
sudo apt-get -y autoclean

echo ">>>>> Removing unnecessary services <<<<<"
sudo apt-get -y purge snapd

echo ">>>>> Removing unnecessary background services <<<<<"
sudo systemctl disable avahi-daemon
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/pulseaudio.desktop


# Sample disk compacting command (but only for .vdi files :/)
# "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifymedium disk "C:\Users\Redondo\VirtualBox VMs\Dangerzone (SSI VM 2022) clon\Dangerzone (SSI VM 2022)-disk001.vdi" --compact