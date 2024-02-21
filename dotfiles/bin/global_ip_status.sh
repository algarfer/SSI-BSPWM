#!/bin/bash

ip="$(curl ifconfig.io 2> /dev/null)"

if [ $? -ne 0 ]; then
  echo "%{F#ff0000} %{F#ffffff}No Network"
else
  echo "%{F#008000} %{F#ffffff}$ip"
fi
