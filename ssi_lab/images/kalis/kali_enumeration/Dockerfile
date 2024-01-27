# Our base Kali machine
FROM ssi/kali_base

USER root

# Prepare the base packages with some useful tools in a way image size is reduced.
RUN apt-get update && apt-get -y full-upgrade \
	&& apt-get install -y --no-install-recommends \
		gcc \
		git \
		knockpy \
		dnsenum \
#		eyewitness \
#		zmap \
		python3 \
		python3-pip \
		python3-dev \
		xauth \
	&& apt-get -y autoremove \
	&& apt-get -y autoclean \
	&& rm -rf /var/lib/apt/lists/*


# Install twint
# RUN pip3 install twint

# COPY twint /root
# WORKDIR /root/twint
# RUN cd /twint
# ADD requirements.txt ./
# RUN pip3 install . -r requirements.txt

# Install eyewitness

# WORKDIR /home/$user 

# RUN	git clone https://github.com/FortyNorthSecurity/EyeWitness.git

# WORKDIR /home/$user/EyeWitness

# RUN cd Python/setup && \
#    ./setup.sh && \
#    cd .. && \
#    chown -R $user:$user /home/$user && \
#    mkdir -p /tmp/EyeWitness && \
#    chown $user:$user /tmp/EyeWitness

#RUN chown -R root:root /home/root && chown -R $user:$user /home/$user

USER $USER_NAME
WORKDIR /home/$USER_NAME

LABEL 	maintainer="Jose Manuel Redondo Lopez" \
	version="1.2" \
	description="Kali image for SSI enumeration laboratories"
