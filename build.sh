#!/bin/bash

# build the binary
nasm -felf64 app.asm
ld app.o -o app

# if specified build and push the container
while getopts "b" opt; do
  case $opt in
    b)
      docker buildx build --platform linux/amd64 --build-arg LANGUAGE=en -t mgent/minimal-container:latest --push .
      ;;
  esac
done
