# Our base Kali machine
FROM ssi/kali_base

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		whois \
		ncat \
		finger \
		php \
		python2 \
		python3 \
		openssh-server \
		openssl \
		vsftpd \
		telnet \
		apache2 \
		libapache2-mod-php \
		samba \
		cifs-utils \
		mariadb-server \
		mariadb-client \
		php php-mysql \
		wordpress \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

ARG SSH_USER=remotessiuser
ARG SSH_USER_PASS=ingenieriainformatica
RUN useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_USER_PASS) $SSH_USER

# Copy a new SMB configuration
COPY smb.conf /etc/samba/

# Worpress configuration
COPY wp.sql /wp.sql

# RUN service mariadb start
# RUN mysql -u root -p < /wp.sql
# RUN service mariadb stop

COPY config-116.0.3.php /etc/wordpress/config-116.0.3.php
COPY wordpress.conf /etc/apache2/sites-available/
RUN a2ensite wordpress && a2enmod rewrite

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh /container_init.sh
RUN chmod +x /container_init.sh
CMD ["/container_init.sh"]

# Exposed ports
EXPOSE 21
EXPOSE 22
EXPOSE 80
EXPOSE 139
EXPOSE 445
EXPOSE 3306

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Highly vulnerable Kali image for SSI exploiting laboratories (Lab 11)"
