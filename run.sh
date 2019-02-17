#!/bin/bash

docker run \
    -p 25565:25565
    -v /local/path/to/world:/minecraft/world \
    minecraft-atm-3
