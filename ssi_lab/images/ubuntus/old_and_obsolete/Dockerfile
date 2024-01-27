# Running from the official Ubuntu 14.04 image
FROM ubuntu:trusty

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Color terminal for better user experience
ENV TERM=xterm-color

# Prepare the base packages with some useful tools in a way image size is reduced.
# DO NOT UPDATE: We want this to be vulnerable!
RUN apt-get update -y && apt-get install -y --no-install-recommends \
		apache2 \
		telnetd \
		update-inetd \
		xinetd \
		vsftpd \
        	openssh-server \
		openssl  \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Replace service configurations for insecure ones
RUN rm /etc/ssh/ssh_config && rm /etc/vsftpd.conf && rm /etc/ftpusers
ADD ./ssh_config /etc/ssh
ADD ./vsftpd.conf /etc/vsftpd.conf
ADD ./ftpusers /etc/ftpusers

# Enable a (very bad) root password
RUN echo "root:letmein" | chpasswd

# Enable telnet service
RUN echo "service telnet \n \
{ \n \
    disable = no \n \
    flags           = REUSE \n \
    socket_type     = stream \n \
    wait            = no \n \
    user            = root \n \
    server          = /usr/sbin/in.telnetd \n \
    log_on_failure  += USERID \n \
}" | tee -a /etc/xinetd.d/telnet && \
    rm -f /etc/securetty

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Non-updated Ubuntu 14.04 Apache HTTP web server with SSH, a vulnerable user, and FTP and Telnet services image for SSI laboratories"
