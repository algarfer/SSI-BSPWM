# Start from our base Apache web server image
FROM ssi/ubuntu_apache2

# Change user so we have privilege to install software
USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		openssh-server \
		openssl \
		iptables \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

# Revert to the original non-privileged user
USER ${USER_NAME}

# Expose SSH port
EXPOSE 22

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Base Ubuntu Apache 2 HTTP web server with SSH image for SSI laboratories"
