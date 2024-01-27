# Start from our base bash-enabled Ubuntu image
FROM ssi/ubuntu_base

# Change user so we have privilege to install software
USER root 

# Install Apache 2 Web server
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		apache2 \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
# PLEASE NOTE: This script only runs if you run the container in detached mode (not in 
# interactive mode)
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh && echo "Starting services..."
CMD ["./container_init.sh"]

# Revert to the original non-privileged user
USER ${USER_NAME}

# Expose web server port
EXPOSE 80

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Base Ubuntu Apache 2 Web Server image for SSI laboratories"
