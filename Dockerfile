FROM openjdk:alpine
MAINTAINER Stefan Urban <stefan.urban@live.de>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565


# Download and unzip minecraft files
RUN apk update && apk add curl wget
RUN mkdir -p /minecraft/world

RUN curl -LO https://addons-origin.cursecdn.com/files/2510/629/Server%20Files.zip
RUN unzip Server%20Files.zip && mv ATM3/* ./
RUN rmdir ATM3


# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script
CMD ["/bin/sh", "/minecraft/ServerStart.sh"] 
