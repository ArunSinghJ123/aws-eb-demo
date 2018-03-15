FROM docker

# Java, Maven & pip

RUN apk update \
	&& apk add openjdk8 maven py-pip \
	&& rm -rf /var/cache/apk/*

# AWS EB CLI

RUN pip install awsebcli --upgrade --user \
	&& ln -s ~/.local/bin/eb /usr/local/bin/eb
