FROM phusion/baseimage:latest
MAINTAINER iansmith@igneous.io
ENV HOME /root


# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

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


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#make workdir homedir
WORKDIR /

### XXXX THIS IS HORRIBLE! Why is this necessary!?!
ENV LD_LIBRARY_PATH /usr/local/lib
