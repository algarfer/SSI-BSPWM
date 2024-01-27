# Our base Kali machine
FROM ssi/kali_base

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		unzip \
		steghide \
		john \
		exiftool \
		gnupg \
		openssl \
		coreutils \
		openssh-client \
		crunch \
		bzip2 \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Copy and uncompress password file
RUN mkdir /wordlist
COPY rockyou.txt.bz2 /wordlist
RUN chmod o+r /wordlist/rockyou.txt.bz2 \
	&& bzip2 -d /wordlist/rockyou.txt.bz2

# Copy the passwd and shadow files
COPY passwd /wordlist
COPY shadow /wordlist
RUN chmod o+r /wordlist/shadow \
	&& chmod o+r /wordlist/passwd

USER $USER_NAME

LABEL maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Kali image for SSI laboratories with crypto software (Labs 3 and 4)"
