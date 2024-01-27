# Our base Ubuntu image
FROM ssi/ubuntu_base_cmd

USER root

# Prepare the base packages with some useful bash cmd tools in a way image size is reduced.
# These software is the one that simulates being in a VM, providing interactive users with
# useful tools. If you put this image to production, you should remove most (if not all) these
# software, as your containers will not be created with the intention to emulate a VM...
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		samba \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Add a sudoer user different from the Vagrant one. Default password and user name
RUN 	useradd -m -s /bin/bash -p $(openssl passwd -1 password) employee \
	&& adduser employee sambashare

# Copy tmux configuration	
# Copy users bash and nano configuration
COPY nanorc /home/employee/.nanorc 
COPY inputrc /home/employee/.inputrc 
COPY bashrc /home/employee/.bashrc 

# Proper permissions for some files copied to the container        
RUN chown employee /home/employee/.nanorc \
        && chown employee /home/employee/.bashrc \
		&& chown employee /home/employee/.inputrc 

# Add another sudoer user different from the Vagrant one. Default password and user name
RUN 	useradd -m -s /bin/bash -p $(openssl passwd -1 admin) admin \ 
	&& adduser admin sudo && adduser admin sambashare

# Copy tmux configuration	
# Copy users bash and nano configuration
COPY nanorc /home/admin/.nanorc 
COPY inputrc /home/admin/.inputrc 
COPY bashrc /home/admin/.bashrc 

# Proper permissions for some files copied to the container        
RUN chown admin /home/admin/.nanorc \
        && chown admin /home/admin/.bashrc \
		&& chown admin /home/admin/.inputrc 

RUN mkdir /samba \
	&& chgrp sambashare /samba \
	&&  mkdir /samba/employee \
	&&  chown employee:sambashare /samba/employee \
	&&  mkdir /samba/admin \
	&&  chown admin:sambashare /samba/admin \
	&& (echo password; echo password) | smbpasswd -s -a employee \
	&& (echo admin; echo admin) | smbpasswd -s -a admin

#COPY container_init.sh container_init.sh
#RUN chmod +x container_init.sh
#CMD ["./container_init.sh"]

# Change to the starting user upon logon
USER $USER_NAME
WORKDIR /home/$USER_NAME

# Shameless self-promotion :P
LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu image for SSI laboratories, bash tools and a SMB service"
