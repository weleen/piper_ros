# run docker container
docker run -it \
           --privileged \
           --network host \
           --device /dev/bus/usb:/dev/bus/usb \
           -e DISPLAY="$DISPLAY" \
           -e QT_X11_NO_MITSHM=1 \
           -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
           -v "$HOME/.Xauthority":/root/.Xauthority:rw \
           -v /home/vcg:/home/vcg \
           -v /dev/dri:/dev/dri \
           --name ros2_container \
           ros-piper \
           /bin/bash
