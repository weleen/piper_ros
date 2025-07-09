# 
docker run -it --privileged --network host --device /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix/:/tmp/.X11-unix/:rw -v /home/vcg:/home/vcg --env=DISPLAY --name ros2_container ros-piper /bin/bash
