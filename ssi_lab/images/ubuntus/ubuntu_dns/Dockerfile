# Start from our base Ubuntu image to have a common toolset
FROM ssi/ubuntu_base

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		bind9 \
		bind9-host \
		dnsutils \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

USER $USER_NAME

# Expose DNS port
EXPOSE 53

LABEL maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu DNS Server image for SSI laboratories"
