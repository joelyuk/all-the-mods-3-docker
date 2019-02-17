FROM openjdk:alpine
MAINTAINER Stefan Urban <stefan.urban@live.de>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565
EXPOSE 25575

RUN apk update && apk add curl bash

# Download and unzip minecraft files
RUN mkdir -p /minecraft/world

RUN curl -LO https://media.forgecdn.net/files/2639/211/All+the+Mods+3+v5.11.2-Serverfiles-FULL.zip
RUN unzip All+the+Mods+3+v5.11.2-Serverfiles-FULL.zip
RUN rm All+the+Mods+3+v5.11.2-Serverfiles-FULL.zip

# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script
CMD ["/bin/bash", "/minecraft/ServerStart.sh"] 
