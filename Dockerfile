FROM amazonlinux:2

COPY install_python36.sh .

RUN ./install_python36.sh

CMD python3 --version
