FROM ubuntu:18.04

MAINTAINER tom@moulard.org

# Certain Installers make 'installations' easier by having a nice front-end.
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /

RUN apt update && apt upgrade -y && apt upgrade --fix-missing -y && \
	apt install -y wget build-essential cmake python3 libreadline-dev \
	valgrind make net-tools iputils-ping iproute2 autoconf \
	libtool flex libboost-all-dev g++-8 autoconf-archive \
	libev-dev libssl-dev automake python3-requests python3-pip

# Criterion
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.4.1/criterion-v2.4.1-linux-x86_64.tar.bz2 && \
	tar xvf criterion-v2.4.1-linux-x86_64.tar.bz2 && \
	cp -r /criterion-v2.4.1/lib/* /usr/lib/ && \
	cp -r /criterion-v2.4.1/include/* /usr/include/ && \
	rm criterion-v2.4.1-linux-x86_64.tar.bz2

# Bison-epita
RUN wget https://www.lrde.epita.fr/~tiger/download/bison-3.2.1.52-cd4f7.tar.gz && \
	tar xvf bison-3.2.1.52-cd4f7.tar.gz && \
	cd /bison-3.2.1.52-cd4f7 && \
	./configure && make && make install && \
	rm /bison-3.2.1.52-cd4f7.tar.gz

# g++8
RUN mv /usr/bin/g++-8 /usr/bin/g++

# Gtest
RUN wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz && \
	tar xvf release-1.8.1.tar.gz && \
	cd /googletest-release-1.8.1 && \
	cmake CMakeLists.txt && make && make install && \
	rm /release-1.8.1.tar.gz

# Python3.7
RUN apt install -y build-essential libssl-dev zlib1g-dev libncurses5-dev \
	libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev \
	libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev \
	libffi-dev && \
	wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz &&\
	tar xf Python-3.7.0.tar.xz && \
	cd /Python-3.7.0 && \
	./configure --enable-optimizations && make -j && make altinstall && \
	rm /Python-3.7.0.tar.xz /Python-3.7.0 -fr

# RUN ["/bin/sh"]
