#!/bin/bash

echo "Configuring automatic date /time"
sudo apt-get install ntp
sudo timedatectl set-timezone Europe/Madrid