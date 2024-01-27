#!/bin/bash

sudo apt purge -y ubuntu-report popularity-contest apport whoopsie >/dev/null 2>&1
sudo ubuntu-report -f send no