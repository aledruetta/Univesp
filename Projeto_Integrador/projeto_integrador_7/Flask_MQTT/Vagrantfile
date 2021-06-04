# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 1883, host: 1883
  config.vm.network "public_network", ip: "192.168.0.100"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "MQTT Broker"
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y dist-upgrade
    apt-get install -y mosquitto mosquitto-clients
  SHELL
end
