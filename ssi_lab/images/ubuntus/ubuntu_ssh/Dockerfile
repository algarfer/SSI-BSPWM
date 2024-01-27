# Start from our base image to have a common toolset
FROM ssi/ubuntu_base_cmd

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		openssh-server \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

# Expose ports
EXPOSE 22
USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu SSH image for SSI laboratories"
