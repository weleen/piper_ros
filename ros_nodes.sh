#!/bin/bash
set -x  # 打开调试模式，显示执行的每一条命令

# 执行环境初始化
# echo "开始初始化ROS环境..."
# source /opt/ros/noetic/setup.bash
# echo "ROS环境已加载"
# catkin_make
# echo "catkin_make 完成"
source devel/setup.bash
echo "devel/setup.bash 已执行"

# 启动ROS节点
echo "正在启动ROS节点..."
# step 1, 启动节点
nohup roscore > piper_ros_noetic_roscore.log 2>&1 &
echo "roscore 已启动"

# step 2, 启动piper节点
nohup roslaunch piper start_single_piper.launch can_port:=can0 auto_enable:=true gripper_val_mutiple:=2 > piper_ros_noetic_piper.log 2>&1 &
echo "piper节点已启动"

# step 2, rosbridge
nohup roslaunch rosbridge_server rosbridge_websocket.launch > piper_ros_noetic_rosbridge.log 2>&1 &

# step 3, moveit
nohup roslaunch piper_with_gripper_moveit demo.launch > piper_ros_noetic_moveit.log 2>&1 &
echo "moveit已启动"

echo "所有节点已启动，进入交互模式"
# 保持脚本运行
exec bash