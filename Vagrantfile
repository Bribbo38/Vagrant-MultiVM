# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # VM's Image
  BOX_IMAGE = "ubuntu/jammy64"

  # VM's names
  WEBHOSTNAME = "web.m340"
  DBHOSTNAME = "db.m340"

  # Intnet ID and IP addresses
  INTNET_NAME = "intnet_vagrant"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"

  # Web Server VM configuration
  config.vm.define "web" do |webconf|
    # VM Image and Name
    webconf.vm.box = BOX_IMAGE
    webconf.vm.hostname = WEBHOSTNAME
    
    # Network cards configuration (1 intnet, 1 hostonly)
    webconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: INTNET_NAME
    webconf.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"

    # Setting up a provisioning scirpt
    webconf.vm.provision "shell", path: "provision-web-server.sh"

    # Syncing the 'html' folder in the VM
    webconf.vm.synced_folder "./html", "/var/www/html", owner: "www-data", group: "www-data"

    # Configuring the VM in VirtualBox
    webconf.vm.provider "virtualbox" do |vb|
      vb.name = WEBHOSTNAME
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

  # MySQL Server VM configuration
  config.vm.define "db" do |dbconf|
    # VM Image and Name
    dbconf.vm.box = BOX_IMAGE
    dbconf.vm.hostname = DBHOSTNAME

    # Network cards configuration (1 intnet)
    dbconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: INTNET_NAME
    
    # Setting up a provisioning scirpt
    dbconf.vm.provision "shell", path: "provision-db-server.sh"

    # Configuring the VM in VirtualBox
    dbconf.vm.provider "virtualbox" do |vb|
      vb.name = DBHOSTNAME
      vb.memory = "2048"
      vb.cpus = 2
    end
  end
end
