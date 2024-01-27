# Our base Apache and SSH image
FROM ssi/ubuntu_base_cmd

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		openssh-server \
		apache2 \
		software-properties-common \
		libapache2-mod-security2 \
		tar  \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Install Suricata
RUN add-apt-repository ppa:oisf/suricata-stable && \
	apt-get -y update && \
	apt-get install -y --no-install-recommends \
		suricata 
#	&& rm -rf /var/lib/apt/lists/*

# Activate proxy functionality
RUN 	a2enmod proxy && \
	a2enmod proxy_http

# Prepare filesystem
RUN 	mkdir /rules && \
	mkdir /var/lib/suricata/

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu Reverse Proxy Apache HTTP web server with SSH image for SSI laboratories"
