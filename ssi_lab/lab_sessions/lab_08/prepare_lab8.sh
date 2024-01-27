#!/bin/bash

cd ../../images
sudo ./build.sh -d ./ubuntus/old_and_obsolete
sudo ./build.sh -d ./ubuntus/ubuntu_base
sudo ./build.sh -d ./ubuntus/ubuntu_base_cmd
# sudo ./build.sh -d ./ubuntus/ubuntu_samba
sudo ./build.sh -d ./ubuntus/ubuntu_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_dns
sudo ./build.sh -d ./ubuntus/ubuntu_apache2
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh
sudo ./build.sh -d ./ubuntus/ubuntu_apache2_ssh_highly_vulnerable
sudo ./build.sh -d ./kalis/kali_base
sudo ./build.sh -d ./kalis/kali_exploiting
cd ../lab_sessions/lab_08
