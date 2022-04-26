FROM ubuntu:18.04

MAINTAINER tom@moulard.org

# Certain Installers make 'installations' easier by having a nice front-end.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt upgrade --fix-missing -y
RUN apt install -y wget build-essential cmake python3 libreadline-dev
RUN apt install -y valgrind make net-tools iputils-ping iproute2 autoconf
RUN apt install -y libtool flex libboost-all-dev g++-8 autoconf-archive
RUN apt install -y libev-dev libssl-dev automake python3-requests python3-pip

# Criterion
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.4.1/criterion-v2.4.1-linux-x86_64.tar.bz2
RUN tar xvf criterion-v2.4.1-linux-x86_64.tar.bz2
RUN cp -r /criterion-v2.4.1/lib/* /usr/lib/
RUN cp -r /criterion-v2.4.1/include/* /usr/include/

WORKDIR /
RUN rm criterion-v2.4.1-linux-x86_64.tar.bz2

# Bison-epita
RUN wget https://www.lrde.epita.fr/~tiger/download/bison-3.2.1.52-cd4f7.tar.gz
RUN tar xvf bison-3.2.1.52-cd4f7.tar.gz
WORKDIR /bison-3.2.1.52-cd4f7
RUN ./configure && make && make install
WORKDIR /
RUN rm bison-3.2.1.52-cd4f7.tar.gz

# g++8
RUN mv /usr/bin/g++-8 /usr/bin/g++

# Gtest
RUN wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz
RUN tar xvf release-1.8.1.tar.gz
WORKDIR /googletest-release-1.8.1
RUN cmake CMakeLists.txt && make && make install
WORKDIR /
RUN rm release-1.8.1.tar.gz

# Python3.7
RUN apt install -y build-essential libssl-dev zlib1g-dev libncurses5-dev
RUN apt install -y libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev
RUN apt install -y libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev
RUN apt install -y libffi-dev
RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
RUN tar xf Python-3.7.0.tar.xz
WORKDIR /Python-3.7.0
RUN ./configure --enable-optimizations && make -j && make altinstall
WORKDIR /
RUN rm Python-3.7.0.tar.xz Python-3.7.0 -fr

# RUN ["/bin/sh"]
