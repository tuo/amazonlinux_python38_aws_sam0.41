FROM amazonlinux:2

COPY install_python3.sh .

# Different versions of Python3 can be installed by changing the script arg
RUN ./install_python3.sh 3.8.0

CMD python3 --version
