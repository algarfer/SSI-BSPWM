#!/bin/bash

user_name=$(cat ../../images/user.txt)
sudo docker exec --user $user_name -w /home/$user_name --env="DISPLAY=${DISPLAY}" -it lab07_firefox_client /bin/bash