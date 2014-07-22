FROM ubuntu:trusty
MAINTAINER iansmith@igneous.io

##
## The objective here is have a system with just trusty plus libzmq version 4.
## The problem is that we end up needing quite a lot of stuff to build libzmq from
## source so we install these things then remove them so we are "clean".
##

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential curl pkg-config
RUN mkdir /tmp/zmq
WORKDIR /tmp/zmq
RUN curl -O http://download.zeromq.org/zeromq-4.0.4.tar.gz
RUN tar xzf zeromq-4.0.4.tar.gz 
WORKDIR /tmp/zmq/zeromq-4.0.4/
RUN ./configure
RUN make install
RUN rm -rf /tmp/zmq
RUN DEBIAN_FRONTEND=noninteractive apt-get remove -y build-essential curl
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove -y
WORKDIR /
