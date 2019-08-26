#!/bin/sh

# Install Python3.6.5
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
tar xJf Python-3.6.5.tar.xz
cd Python-3.6.5
./configure
make
make install

# Clean up
cd ..
rm -rf Python3.6.5
