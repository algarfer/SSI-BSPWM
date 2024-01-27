# Start from our base Apache web server image
FROM ssi/ubuntu_apache2_ssh_cmd

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		sudo \
		python \
		python3 \
		whois \
		binutils \
		libapache2-mod-php \
		cron \
		vsftpd \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*


ARG USER_PASS=test123...

# More users to perform different tests
RUN useradd -m -s /bin/rbash -p $(openssl passwd -1 $USER_PASS) restricted
RUN useradd -m -s /bin/bash -p $(openssl passwd -1 $USER_PASS) testUser

# Replace service configurations for insecure ones
RUN rm /etc/vsftpd.conf && rm /etc/ftpusers
ADD ./vsftpd.conf /etc/vsftpd.conf
ADD ./ftpusers /etc/ftpusers

# Enable a (very bad) root password
RUN echo "root:iloveyou" | chpasswd

# SETUID programs
RUN chmod +s /usr/bin/find && \
	chmod +s /usr/bin/base32 &&  \
	chmod +s /usr/bin/cat &&  \
	chmod +s /usr/bin/python2.7 && \
	chmod +s /usr/bin/cp 

# Sudoer control file
ADD ./sudoers /etc/

# Add cron job
ADD ./integrity_check.py /tmp/
RUN chmod go+wx /tmp/integrity_check.py

# Add crontab file
# ADD ./root /var/spool/cron/crontabs/
ADD ./crontab /etc/
RUN chmod g-w /etc/crontab

# Copy compromising Python script
ADD ./main_check.py /
RUN chown root:root /main_check.py
RUN chmod o+rx /main_check.py
ADD ./file_check.py /tmp/
RUN chmod go+wx /tmp/file_check.py

# Misconfigure web permissions
RUN chmod o+w /var/www/html

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu Apache HTTP web server with SSH image for exploiting laboratories (Lab 12)"
