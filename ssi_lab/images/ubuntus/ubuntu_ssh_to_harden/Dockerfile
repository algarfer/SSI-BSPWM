# Our base SSH image
FROM ssi/ubuntu_ssh

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		git \
		apt-transport-https \
		libpam-cracklib \
		ca-certificates \
		acct \
		sysstat \
		glances \
		gnupg2 \
        	sudo \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Install the lastest version of lynis
RUN wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | apt-key add - && \
	echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | tee /etc/apt/sources.list.d/cisofy-lynis.list && \
	apt-get -y update && \
	apt-get install lynis 
#	&& rm -rf /var/lib/apt/lists/*

# Copy and run an initialization script to start the appropriate servers in the containers
COPY container_init.sh container_init.sh
RUN chmod +x container_init.sh
CMD ["./container_init.sh"]

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu SSH image to manually harden for SSI laboratories (Lab 5)"
