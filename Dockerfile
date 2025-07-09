# Extend the ROS2 distro
FROM osrf/ros:humble-desktop-full

# Install the required packages
RUN apt-get update \
 && apt-get install -y \
 python3-pip ethtool can-utils usbutils iproute2
RUN pip3 install python-can scipy piper_sdk
RUN apt-get install -y \
 ros-humble-ros2-control \
 ros-humble-ros2-controllers \
 ros-humble-controller-manager \
 && rm -rf /var/lib/apt/lists/*
