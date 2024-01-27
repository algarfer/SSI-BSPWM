# Our base SSH image
FROM ssi/ubuntu_ssh


# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		openssh-client \
		ftp \
		knockd \
		nmap \
        	locate \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="SSH image for SSI laboratories (Lab 7, network defenses testing)"
