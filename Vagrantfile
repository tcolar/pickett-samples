#
# Vagrant file for playing with pickett.
#
$script = <<SCRIPT
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update -y
apt-get install -y lxc-docker git golang
mkdir -p /opt
git clone https://github.com/coreos/etcd /opt/etcd
cd /opt/etcd
./build
mkdir -p /opt/etc/datadir
/opt/etcd/bin/etcd -data-dir=/opt/etcd/datadir -name=ubuntu1404 >& /var/log/etcd &
echo DOCKER_OPTS=--host=tcp://0.0.0.0:2375 >> /etc/default/docker
restart docker
SCRIPT

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "fvalton/ubuntu-14.04-64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 2375, host: 2375
  config.vm.network "forwarded_port", guest: 4001, host: 4001

  # Mount /vagrant via NFS
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision "shell", inline: $script
end