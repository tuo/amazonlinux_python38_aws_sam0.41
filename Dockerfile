FROM amazonlinux:2

RUN yum install -y wget tar make xz gcc zlib-devel openssl-devel

COPY install_python36.sh .

RUN ./install_python36.sh

CMD python3 --version
