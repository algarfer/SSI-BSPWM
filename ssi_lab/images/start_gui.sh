#!/bin/bash

helpFunction()
{
   echo "Usage: $0 -d <directory of the image>"
   echo -e "\t-d Directory where a img_name.txt file is present"
   echo -e "Example: $0 -d ./ubuntus/ubuntu_base/"
   exit 1 # Exit script after printing help
}

while getopts "d:" opt
do
   case "$opt" in
      d ) img_name=$(cat ./$OPTARG/img_name.txt) ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$img_name" ] 
then
   echo "The directory (-d) parameter is empty";
   helpFunction
fi

user_name=$(cat user.txt)

echo -e "Running a container from the $img_name image opening a bash command line and GUI application support..."

sudo docker run -it -h ssi_container --volume="/tmp/.X11-unix:/tmp/.X11-unix" --env="DISPLAY=${DISPLAY}" --user $user_name $img_name /bin/bash
