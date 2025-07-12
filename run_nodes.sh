#!/bin/bash
set -x  # 打开调试模式，显示执行的每一条命令

# 执行环境初始化
echo "开始初始化ROS环境..."
source /opt/ros/humble/setup.bash
echo "ROS环境已加载"
colcon build
echo "colcon build 完成"
source install/setup.bash
echo "install/setup.bash 已执行"

# 启动ROS节点
echo "正在启动ROS节点..."
# step 1, 启动节点
ros2 run piper piper_single_ctrl --ros-args -p can_port:=can0 -p auto_enable:=true -p gripper_exist:=true -p gripper_val_mutiple:=2 > piper_ros_humble_piper.log 2>&1 &
echo "piper节点已启动"

# step 2, 
# step 3, moveit
nohup roslaunch piper_with_gripper_moveit demo.launch > piper_ros_noetic_moveit.log 2>&1 &
echo "moveit已启动"

echo "所有节点已启动，进入交互模式"
# 保持脚本运行
exec bash