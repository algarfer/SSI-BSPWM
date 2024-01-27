#!/bin/bash

sudo docker rmi -f $(docker images -a -q) 2>/dev/null