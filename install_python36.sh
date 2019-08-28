#!/bin/sh

DEPENDENCIES="wget tar make xz gcc zlib-devel openssl-devel"

# Install system dependencies
yum install -y $DEPENDENCIES

# Install Python3.6.1
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar xJf Python-3.6.1.tar.xz
cd Python-3.6.1
./configure
make
make install

# Clean up
cd ..
rm -rf Python3.6.1
yum remove -y $DEPENDENCIES
