# Extend the ROS2 distro
FROM osrf/ros:humble-desktop-full

# Install the required packages
RUN apt-get update \
 && apt-get install -y \
 python3-pip ethtool can-utils usbutils iproute2 vim
RUN pip3 install python-can scipy piper_sdk
RUN apt-get install -y \
 ros-humble-ros2-control \
 ros-humble-ros2-controllers \
 ros-humble-controller-manager
## install Moveit2
RUN apt install -y ros-humble-moveit*
RUN apt-get install -y ros-humble-control* \
                       ros-humble-joint-trajectory-controller \
                       ros-humble-joint-state-* \
                       ros-humble-gripper-controllers \
                       ros-humble-trajectory-msgs \
                       ros-humble-moveit* \
                       ros-humble-moveit-configs* \
                       ros-humble-moveit-planners* \
                       ros-humble-moveit-plugins* \
                       && rm -rf /var/lib/apt/lists/*
## set locale
RUN echo "export LC_NUMERIC=en_US.UTF-8" >> ~/.bashrc
# RUN source ~/.bashrc

# Activate CAN device
WORKDIR /root/piper_ros
COPY . .
# # For single CAN device
# RUN bash can_activate.sh can0 1000000
# RUN colcon build

CMD ["bash -c 'can_activate.sh can0 1000000 && source /opt/ros/humble/setup.bash && rm -rf build && colcon build'"]