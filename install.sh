#!/bin/bash

# ロケール設定
echo "Setup Locale"
sudo locale-gen ja_JP ja_JP.UTF-8
sudo update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# ソースの設定
echo "Setup Sources"
sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# ROS2のインストール
echo "Install ROS 2 packages"
sudo apt update
sudo apt install ros-dashing-desktop

# 関連ツールのインストール
echo "Install argcomplete"
sudo apt install python3-argcomplete

# 環境変数設定
echo "Environment setup"
source /opt/ros/dashing/setup.bash
echo “source /opt/ros/dashing/setup.bash” >> ~/.bashrc
