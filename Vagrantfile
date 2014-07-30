#
# Vagrant file for playing with pickett. Based on Ubuntu 14.04.
# Contains etcd, docker, git and go.
#

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Pickett box loaded from AWS S3 bucket
  config.vm.box = "igneous-launcher-003"
  config.vm.box_url = "http://igneous-dev.s3.amazonaws.com/vagrant/#{config.vm.box}.box"

  # Forward ports for docker (:2375) and etcd (:4001)
  config.vm.network "forwarded_port", guest: 2375, host: 2375
  config.vm.network "forwarded_port", guest: 4001, host: 4001

  # Mount /vagrant via NFS
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end
