#!/bin/bash

cd ../../images
sudo ./build.sh -d ./kalis/kali_base
sudo ./build.sh -d ./kalis/kali_privesc

sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_base_cmd
sudo ./build.sh -d ./ubuntus/ubuntu_apache2
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh_cmd
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh_privesc

cd ../lab_sessions/lab_12
