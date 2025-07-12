# run docker container
docker run -it \
           --privileged \
           --network host \
           --device /dev/bus/usb:/dev/bus/usb \
           -e DISPLAY="$DISPLAY" \
           -e QT_X11_NO_MITSHM=1 \
           -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
           -v "$HOME/.Xauthority":/root/.Xauthority:rw \
           -v /home/vcg/Documents/code/github/:/root/github/ \
           -v /dev/dri:/dev/dri \
           --name ros1_container \
           piper-ros-noetic \
           bash
        #    bash -c "bash ros_nodes.sh; bash"
