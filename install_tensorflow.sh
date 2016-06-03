#!/bin/bash

echo "Installing tensorflow"
sudo apt-get install -y python-pip python-dev libpng-dev libfreetype6-dev
sudo pip install matplotlib
sudo pip install jupyter
sudo pip install pandas
sudo pip install flask --upgrade
sudo pip install flask-httpauth
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl
