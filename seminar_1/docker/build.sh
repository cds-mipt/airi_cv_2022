#!/bin/bash

orange=`tput setaf 3`
reset_color=`tput sgr0`

if command -v nvidia-smi &> /dev/null
then
    echo "Building for ${orange}nvidia${reset_color} hardware"
    DOCKERFILE=Dockerfile.nvidia
else
    echo "Building for ${orange}intel${reset_color} hardware: nvidia driver not found"
    DOCKERFILE=Dockerfile.intel
fi

docker build . \
    -f $DOCKERFILE \
    --build-arg UID=${UID} \
    --build-arg GID=${UID} \
    -t segmentator:latest
