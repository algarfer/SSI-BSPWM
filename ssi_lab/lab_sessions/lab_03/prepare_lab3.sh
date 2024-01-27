#!/bin/bash

cd ../../images
sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_base_cmd
sudo ./build.sh -d ./ubuntus/ubuntu_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_ssh_crypto
sudo ./build.sh -d ./kalis/kali_base
sudo ./build.sh -d ./kalis/kali_crypto
cd ../lab_sessions/lab_03
