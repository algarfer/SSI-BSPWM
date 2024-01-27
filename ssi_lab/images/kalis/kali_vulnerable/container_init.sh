#!/bin/bash
service vsftpd start
service ssh start
service apache2 start
service mariadb start
service smbd start
service nmbd start
tail -f /dev/null
