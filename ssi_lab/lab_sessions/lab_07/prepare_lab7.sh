#!/bin/bash

cd ../../images
sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_base_cmd
sudo ./build.sh -d ./ubuntus/ubuntu_base_cmd_firefox
sudo ./build.sh -d ./ubuntus/ubuntu_apache2
sudo ./build.sh -d ./ubuntus/ubuntu_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_ssh_network_attack
sudo ./build.sh -d ./ubuntus/ubuntu_ssh_vpn_client
cd ../lab_sessions/lab_07
