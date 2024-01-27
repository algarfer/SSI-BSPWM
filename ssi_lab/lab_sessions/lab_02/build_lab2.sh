#!/bin/bash

USER_NAME=$(cat ../../images/user.txt)

sudo docker-compose up && docker-compose rm -fsv