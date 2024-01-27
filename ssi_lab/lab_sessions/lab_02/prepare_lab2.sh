#!/bin/bash

cd ../../images
sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_apache2
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_dns
sudo ./build.sh -d ./kalis/kali_base
sudo ./build.sh -d ./kalis/kali_enumeration
cd ../lab_sessions/lab_02
