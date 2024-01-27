#!/bin/bash

cd ../../images
sudo ./build.sh -d ./kalis/kali_base
sudo ./build.sh -d ./kalis/kali_light_exploiting
sudo ./build.sh -d ./kalis/kali_vulnerable
cd ../lab_sessions/lab_10
