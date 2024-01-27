# Latest public official Ubuntu 20.04 image release
FROM ubuntu:focal

# Avoid errors from asking for user input
ENV DEBIAN_FRONTEND=noninteractive

# Color terminal for better user experience
ENV TERM=xterm-color

# Exclude man pages & other documentation
# RUN rm /etc/dpkg/dpkg.cfg.d/excludes
COPY excludes /etc/dpkg/dpkg.cfg.d/

# We run this apart from the following apt-get commands to speed up dependent image creation.
# This way these update commands become cached and dependant images will not be run again.
# BEWARE: This increases image size and also may not install up-to-date software in dependant
# images if only these are built, but causes major lab building speedups.
# As these images are not production-enabled, but for teaching, we assume the risk.
# Please consider this issue if you put these images to production.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*

# Ensure that containers uses the same clock and timezone than the hosts.
COPY timezone /etc/timezone
COPY localtime /etc/localtime
RUN chmod o+r /etc/timezone && chmod o+r /etc/localtime

# Delete unnecessary files (decrease container size)
RUN rm -r /usr/share/locale/* \ 
        && rm -r /usr/share/doc/*


# Shameless self-promotion :P
LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Base Ubuntu image for SSI laboratories"
