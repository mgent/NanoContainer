#!/bin/bash
# build the binary
nasm -felf64 app.asm
ld app.o -o app
# build and push the container
docker buildx build --platform linux/amd64 --build-arg LANGUAGE=en -t mgent/minimal-container:latest --push .
