#!/bin/bash

user_name=$(cat ../../images/user.txt)
sudo docker exec --user $user_name -w /home/$user_name -it lab12_kali_privesc /bin/bash