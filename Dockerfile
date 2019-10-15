FROM amazonlinux:2

COPY install_python3.sh .

RUN ./install_python3.sh 3.8.0

CMD python3 --version
