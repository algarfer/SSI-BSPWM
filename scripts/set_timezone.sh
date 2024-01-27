#!/bin/bash

echo "Configuring automatic date /time"
sudo apt install -y ntp
sudo timedatectl set-timezone Europe/Madrid