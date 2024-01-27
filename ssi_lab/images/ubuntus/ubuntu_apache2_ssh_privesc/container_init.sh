#!/bin/bash
service ssh start
service apache2 start
touch /etc/crontab /etc/cron.*/*
service cron start
service vsftpd start
tail -f /dev/null
