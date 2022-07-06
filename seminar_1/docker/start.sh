#!/bin/bash

orange=`tput setaf 3`
reset_color=`tput sgr0`

if command -v nvidia-smi &> /dev/null
then
    echo "Running on ${orange}nvidia${reset_color} hardware"
    ARGS="--gpus all -e NVIDIA_DRIVER_CAPABILITIES=all"
else
    echo "Running on ${orange}intel${reset_color} hardware: nvidia driver not found"
    ARGS="--device=/dev/dri:/dev/dri"
fi

xhost +
docker run -itd --rm \
    $ARGS \
    --ipc host \
    --privileged \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /home/${USER}:/home/${USER} \
    -p ${UID}0:22 \
    --name airi_cv \
    segmentator:latest
xhost -

docker exec --user root \
    airi_cv bash -c "/etc/init.d/ssh start"
