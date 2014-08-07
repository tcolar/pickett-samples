FROM uggedal/alpine

MAINTAINER iansmith@igneous.io

# Set correct environment variables.
ENV HOME /root

# All the extra stuff we need to build zeromq from sources
run apk add -U wget make musl-dev gcc g++

#run debian_frontend=noninteractive apt-get install -y build-essential curl pkg-config
run mkdir /tmp/zmq
workdir /tmp/zmq
run wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
run tar xzf zeromq-4.0.4.tar.gz 
workdir /tmp/zmq/zeromq-4.0.4/
run ./configure
run make install
run rm -rf /tmp/zmq

#make workdir homedir
WORKDIR /

### XXXX THIS IS HORRIBLE! Why is this necessary!?!
ENV LD_LIBRARY_PATH /usr/local/lib
