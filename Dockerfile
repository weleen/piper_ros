# Extend the ROS2 distro
FROM osrf/ros:noetic-desktop-full

# Install the required packages
RUN apt-get update \
 && apt-get install -y \
 python3-pip ethtool can-utils usbutils iproute2 vim net-tools
RUN pip3 install python-can piper_sdk
# RUN source /opt/ros/noetic/setup.bash
RUN apt-get install -y \
        python3-wstool python3-catkin-tools python3-rosdep ros-noetic-ruckig \
        ros-noetic-eigen-stl-containers ros-noetic-geometric-shapes ros-noetic-pybind11-catkin \
        ros-noetic-moveit-resources-panda-moveit-config ros-noetic-ompl ros-noetic-warehouse-ros ros-noetic-eigenpy ros-noetic-rosparam-shortcuts \
        ros-noetic-moveit-msgs ros-noetic-srdfdom
## install Moveit
RUN apt install -y ros-noetic-moveit

# ## set locale
# RUN echo "export LC_NUMERIC=en_US.UTF-8" >> ~/.bashrc
# RUN source ~/.bashrc

# Activate CAN device
# WORKDIR /root/piper_ros_noetic
# COPY . .
# # For single CAN device
# RUN bash can_activate.sh can0 1000000
# RUN colcon build

# CMD ["bash -c 'can_activate.sh can0 1000000 && source /opt/ros/noetic/setup.bash && rm -rf build install devel && colcon build && source install/setup.bash'"]
CMD ["bash -c 'source /opt/ros/noetic/setup.bash && rm -rf devel && catkin_make && source devel/setup.bash'"]