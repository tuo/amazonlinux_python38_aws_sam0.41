#!/bin/sh

if [ -z $1 ]
then
    VERSION="3.6.1"
else
    VERSION=$1
fi

echo "Installing Python version ${VERSION}"

NON_REMOVABLE_DEPENDENCIES="gcc"
REMOVABLE_DEPENDENCIES="wget tar make xz zlib-devel openssl-devel libffi-devel"

# Install system dependencies
yum install -y $NON_REMOVABLE_DEPENDENCIES $REMOVABLE_DEPENDENCIES

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
yum remove -y $REMOVABLE_DEPENDENCIES

python3 --version

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
#pip install -Iv aws-sam-cli==0.41.0
pip install https://files.pythonhosted.org/packages/2d/2c/291cc243b7e9de43a752608a8ad77a3c7dfdf0ffc5d3ce466ea28dc761e4/aws-sam-cli-0.41.0.tar.gz

sam --version

