# Our base Ubuntu image
FROM ssi/ubuntu_base_cmd

USER root

# Install Firefox. This container should be only started with the GUI-enabling option
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		firefox \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Change to the starting user upon logon
USER $USER_NAME


# Shameless self-promotion :P
LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Ubuntu image for SSI laboratories with Firefox and bash tools"
