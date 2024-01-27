# Our base Ubuntu image
FROM ssi/ubuntu_base


# Prepare the base packages with some useful bash cmd tools in a way image size is reduced.
# These software is the one that simulates being in a VM, providing interactive users with
# useful tools. If you put this image to production, you should remove most (if not all) these
# software, as your containers will not be created with the intention to emulate a VM...
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
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
		sudo \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Add a sudoer user different from the Vagrant one. Default password and user name
ARG SSH_PASS=test123...
ARG USER_NAME=ssiuser
RUN 	useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_PASS) $USER_NAME \ 
	&& adduser $USER_NAME sudo

# Copy tmux configuration	
# Copy users bash and nano configuration
COPY nanorc /root/.nanorc 
COPY inputrc /root/.inputrc 
COPY bashrc /root/.bashrc
COPY nanorc /home/$USER_NAME/.nanorc 
COPY inputrc /home/$USER_NAME/.inputrc 
COPY bashrc /home/$USER_NAME/.bashrc 
COPY motd /etc/motd 
COPY tmux.conf /etc/tmux.conf

# Proper permissions for some files copied to the container        
RUN chown $USER_NAME /home/$USER_NAME/.nanorc \
        && chown $USER_NAME /home/$USER_NAME/.bashrc \
		&& chown $USER_NAME /home/$USER_NAME/.inputrc \
        # Copy welcome banner
        && chmod o+rx /etc/motd \
        && chmod o+r /etc/tmux.conf 

# Change to the starting user upon logon
USER $USER_NAME
WORKDIR /home/$USER_NAME

# Shameless self-promotion :P
LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Base Ubuntu image for SSI laboratories and bash tools"
