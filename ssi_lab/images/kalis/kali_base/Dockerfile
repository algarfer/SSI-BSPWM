# Latest public official Kali Linux Rolling-Release image 
FROM kalilinux/kali-rolling

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Color terminal for better user experience
ENV TERM=xterm-color

# Exclude man pages & other documentation
# RUN rm /etc/dpkg/dpkg.cfg.d/excludes
COPY excludes /etc/dpkg/dpkg.cfg.d/

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
		adduser \
		bash-completion \
		curl \
		iputils-ping \
		nano \
		net-tools \
		wget \
		less \
		tmux \
		gpm \
		mc \
		openssl \
		nmap \
		sudo \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Add sudoer user
ARG SSH_PASS=test123...
ARG USER_NAME=ssiuser
RUN 	useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_PASS) $USER_NAME \ 
	&& adduser $USER_NAME sudo

# Copy tmux configuration	
# Copy users bash and nano configuration
COPY nanorc /root/.nanorc 
COPY .bashrc /root/.bashrc
COPY nanorc /home/$USER_NAME/.nanorc 
COPY .bashrc /home/$USER_NAME/.bashrc 
COPY motd /etc/motd 
COPY tmux.conf /etc/tmux.conf
        
RUN chown $USER_NAME /home/$USER_NAME/.nanorc \
        && chown $USER_NAME /home/$USER_NAME/.bashrc \
        # Copy welcome banner
        && chmod o+rx /etc/motd \
        && chmod o+r /etc/tmux.conf 

# Ensure that containers uses the same clock and timezone than the hosts.
COPY timezone /etc/timezone
COPY localtime /etc/localtime
RUN chmod o+r /etc/timezone && chmod o+r /etc/localtime

# Delete unnecessary files
RUN rm -r /usr/share/locale/* \ 
        && rm -r /usr/share/doc/*

# Change the starting user
USER $USER_NAME
WORKDIR /home/$USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Base Kali Linux Rolling image for SSI laboratories"
