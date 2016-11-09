#!/bin/bash




# Install Nvidia Driver
command -v nvidia-smi >/dev/null 2>&1 || { echo "Installing Nvidia Library" >&2; sudo apt-get install nvidia-352-updates;} 

# Install python3 dependencies
sudo apt-get update && sudo apt-get install python3-numpy swig python3-dev python3-wheel python3-pip

# Download cuda_tookit and cudann files
# Use SCP
sudo dpkg -i cuda-repo-ubuntu1404*amd64.deb
sudo apt-get update
sudo apt-get install cuda

# Environmental variables for cuda toolkit
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# Copy CudaNN
tar xvf cudnn*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*

# Check Cuda Version:
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

# Append Environment variables
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64' >> ~/.bashrc
echo 'export CUDA_VISIBLE_DEVICES=0' >> ~/.bashrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
echo 'export LANG=en_US.UTF-8' >> ~/.bashrc

# Check Python version:
# Python 3.4.3+

# Python 3.4 export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp34-cp34m-linux_x86_64.whl
# Python 3.5 export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp35-cp35m-linux_x86_64.whl
sudo pip3 install --upgrade $TF_BINARY_URL

sudo pip3 install numpy pandas matplotlib jsonpickle
