#!/bin/bash

$pip=pip

echo "Installing tensorflow"
sudo apt-get install -y python-pip python-dev 
sudo $pip install libpng-dev libfreetype6-dev matplotlib
sudo $pip install jupyter
sudo $pip install pandas
sudo $pip install scipy
sudo $pip install flask flask-httpauth --upgrade
sudo $pip install simplejson jsonpickle
#sudo $pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl
