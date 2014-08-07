#!/bin/sh

# This creates a (small) local docker image named igneous-systems/tinycore based on the latest tinycore 5.x distro.
#
# TODO: Maybe upload it into the dcoker registry hub ?

set -x
# Get tinycore
wget --continue http://distro.ibiblio.org/tinycorelinux/5.x/x86_64/release/distribution_files/rootfs64.gz
# Transfrom the zipped cpio image into a tarball
gunzip -f rootfs64.gz
mkdir -p ./tmp/
cd tmp
sudo cpio -idv < ../rootfs64
# Create a few entries in the tarball that are necessary for tce-* to work
# 1001:50 are the tc user uid & gid
sudo mkdir -p home/tc tmp/tce etc/sysconfig/tcedir
sudo chown 1001:50 home/tc tmp/tce etc/sysconfig/tcedir
echo "tc" | sudo tee --append etc/sysconfig/tcuser
sudo chown 1001:50 etc/sysconfig/tcuser
# Create the dcoker image
sudo tar -c . | docker import - igneous/tinycore
cd ..

# We can run it like so:
#  docker run -t --privileged=true -i igneous/tinycore /bin/sh
# Note: --privileged is required for the "pakage-manager" (tce-*) to work as it need to mount loopback devices.
