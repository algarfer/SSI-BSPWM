#!/bin/bash

sudo docker rm -vf $(docker ps -a -q) 2>/dev/null