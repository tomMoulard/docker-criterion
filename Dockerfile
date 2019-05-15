FROM ubuntu:18.04

RUN apt update && apt upgrade -y
RUN apt upgrade --fix-missing -y
RUN apt install -y --reinstall wget build-essential cmake python3 \
libreadline-dev valgrind make net-tools iputils-ping iproute2 autoconf \
libtool flex libboost-all-dev g++-8 autoconf-archive libev-dev libssl-dev \
automake python3-requests python3-pip

# Criterion
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2
RUN tar xvf criterion-v2.3.3-linux-x86_64.tar.bz2
RUN rm criterion-v2.3.3-linux-x86_64.tar.bz2

RUN cp -r /criterion-v2.3.3/lib/* /usr/lib/
RUN cp -r /criterion-v2.3.3/include/* /usr/include/

# Bison-epita
RUN wget https://www.lrde.epita.fr/~tiger/download/bison-3.2.1.52-cd4f7.tar.gz
RUN tar xvf bison-3.2.1.52-cd4f7.tar.gz
RUN rm bison-3.2.1.52-cd4f7.tar.gz
RUN cd bison-3.2.1.52-cd4f7 && ./configure && make && make install

# g++8
RUN mv /usr/bin/g++-8 /usr/bin/g++

# Gtest
RUN wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz
RUN tar xvf release-1.8.1.tar.gz
RUN rm release-1.8.1.tar.gz
RUN cd googletest-release-1.8.1/ && cmake CMakeLists.txt && make && make install

# RUN ["/bin/sh"]
