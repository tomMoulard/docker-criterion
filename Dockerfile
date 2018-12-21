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

RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2
RUN tar xvf criterion-v2.3.3-linux-x86_64.tar.bz2

RUN cp -r /criterion-v2.3.3/lib/* /usr/lib/
RUN cp -r /criterion-v2.3.3/include/* /usr/include/

# RUN ["/bin/sh"]
