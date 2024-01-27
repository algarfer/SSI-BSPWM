# Our base Kali machine
FROM ssi/kali_base

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		metasploit-framework \
		python2 \
		python3 \
		openssl \
		whois \
		ssh \
		binutils \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy a most common password file
RUN mkdir /wordlist
COPY 2020mostcommon.txt /wordlist/

USER $USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Kali image for SSI exploiting laboratories (Lab 12)"
