#!/bin/bash

ethStatus=$(/usr/sbin/ifconfig ens33 2> /dev/null)

inetP=$(echo "$ethStatus" | grep 'inet ')

if ! [[ -z $inetP ]]; then
	echo "%{F#2495e7} %{F#ffffff}$(echo "$inetP" | awk '{print $2}')%{u-}"
else
	echo "%{F#ff0000} %{F#ffffff}No Network"
fi
