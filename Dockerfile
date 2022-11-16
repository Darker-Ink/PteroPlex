FROM debian:buster

# Credits to DBH for the egg
MAINTAINER darkerink, <darkerinker@gmail.com>

RUN apt update \
    && apt upgrade -y \
    && apt -y install curl software-properties-common locales git \
    && apt -y install default-jre \
    && apt -y install zip unzip \
    && apt -y install apt-transport-https \
    && apt -y install lzma liblzma-dev libcurl4 libcurl4-openssl-dev \
    && apt -y install make \
    && apt -y install ffmpeg \
    && apt -y install build-essential \
    && apt -y install wget \ 
    && apt -y install curl \
    && apt -y install libtool \
    && adduser container \
    && apt-get update 
    

# Grant sudo permissions to container user for commands
RUN apt-get update && \
    apt-get -y install sudo

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install basic software support
RUN apt-get update && \
    apt-get install -y software-properties-common


RUN curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
RUN echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
RUN apt update && apt install -y plexmediaserver

RUN mv /usr/lib/plexmediaserver/Plex\ Media\ Server /usr/lib/plexmediaserver/plexmediaserver

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]