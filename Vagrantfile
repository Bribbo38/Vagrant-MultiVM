# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  BOX_IMAGE = "ubuntu/jammy64"

  WEBHOSTNAME = "web.m340"
  DBHOSTNAME = "db.m340"

  INTNET_NAME = "intnet_vagrant"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"

  config.vm.define "web" do |webconf|
    webconf.vm.box = BOX_IMAGE
    webconf.vm.hostname = WEBHOSTNAME
    
    webconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: INTNET_NAME
    webconf.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"

    webconf.vm.provision "shell", path: "provision-web-server.sh"

    webconf.vm.synced_folder "./html", "/var/www/html", owner: "www-data", group: "www-data"

    webconf.vm.provider "virtualbox" do |vb|
      vb.name = WEBHOSTNAME
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

  config.vm.define "db" do |dbconf|
    dbconf.vm.box = BOX_IMAGE
    dbconf.vm.hostname = DBHOSTNAME

    dbconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: INTNET_NAME
    
    dbconf.vm.provision "shell", path: "provision-db-server.sh"

    dbconf.vm.provider "virtualbox" do |vb|
      vb.name = DBHOSTNAME
      vb.memory = "2048"
      vb.cpus = 2
    end
  end
end
