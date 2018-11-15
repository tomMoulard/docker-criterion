FROM ubuntu:18.04
MAINTAINER tom@moulard.org

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y python3
RUN apt-get install -y libreadline-dev
RUN apt-get install -y --reinstall make
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2
RUN tar xvf criterion-v2.3.2-linux-x86_64.tar.bz2

RUN cp -r /criterion-v2.3.2/lib/* /usr/lib/
RUN cp -r /criterion-v2.3.2/include/* /usr/include/

RUN ["/bin/sh"]
