# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "forwarded_port", guest: 1883, host: 1883
  config.vm.network "forwarded_port", guest: 8883, host: 8883
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "public_network", ip: "192.168.0.100"

  config.vm.synced_folder ".", "/home/vagrant/webapp"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "MQTT Broker PI7"
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y dist-upgrade
    apt-get install -y mosquitto mosquitto-clients
    apt-get install -y postgresql postgresql-contrib
    apt-get install -y nginx
    apt-get install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
    apt-get install -y python3-venv
  SHELL
end
