FROM ubuntu:18.04

RUN apt update && apt upgrade -y
RUN apt upgrade --fix-missing -y
RUN apt install -y wget
RUN apt install -y build-essential
RUN apt install -y cmake
RUN apt install -y python3
RUN apt install -y libreadline-dev
RUN apt install -y valgrind
RUN apt install -y --reinstall make
RUN apt install -y net-tools
RUN apt install -y iputils-ping
RUN apt install -y iproute2
RUN apt install -y autoconf
RUN apt install -y libtool
RUN apt install -y flex
RUN apt install -y libboost-all-dev
RUN apt install -y g++-8

# Criterion
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2
RUN tar xvf criterion-v2.3.3-linux-x86_64.tar.bz2

RUN cp -r /criterion-v2.3.3/lib/* /usr/lib/
RUN cp -r /criterion-v2.3.3/include/* /usr/include/

# Bison-epita
RUN wget https://www.lrde.epita.fr/~tiger/download/bison-3.2.1.52-cd4f7.tar.gz
RUN tar xvf bison-3.2.1.52-cd4f7.tar.gz
RUN cd bison-3.2.1.52-cd4f7 && ./configure && make && make install

# g++8
RUN mv /usr/bin/g++-8 /usr/bin/g++

# RUN ["/bin/sh"]
