#!/bin/sh

if [ -z $1 ]
then
    VERSION="3.6.1"
else
    VERSION=$1
fi

echo "Installing Python version ${VERSION}"

DEPENDENCIES="wget tar make xz gcc zlib-devel openssl-devel libffi-devel"

# Install system dependencies
yum install -y $DEPENDENCIES

# Install Python
wget "https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tar.xz"
tar xJf "Python-${VERSION}.tar.xz"
cd "Python-${VERSION}"
./configure
make
make install

# Clean up
cd ..
rm -rf "Python${VERSION}"
yum remove -y $DEPENDENCIES
