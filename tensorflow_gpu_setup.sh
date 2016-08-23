#!/bin/bash




# Install Nvidia Driver
command -v nvidia-smi >/dev/null 2>&1 || { echo "Installing Nvidia Library" >&2; sudo apt-get install nvidia-352-updates;} 

# Install python3 dependencies
sudo apt-get update && sudo apt-get install python3-numpy swig python3-dev python3-wheel python3-pip

# Download cuda_tookit and cudann files
# Use SCP

# Copy CudaNN
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# Append Environment variables
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export CUDA_VISIBLE_DEVICES=0' >> ~/.bashrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
