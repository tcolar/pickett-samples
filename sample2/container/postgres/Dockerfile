FROM phusion/baseimage:latest
MAINTAINER iansmith@igneous.io


# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

##
## The objective here is to get a working postgres that can be started from runit
##

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-9.3

RUN mkdir -p /etc/service/postgres
COPY postgres /etc/service/postgres/run
RUN chmod +x /etc/service/postgres/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#make workdir homedir
WORKDIR /
