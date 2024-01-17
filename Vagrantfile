# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "private_network", ip:"192.168.169.10"
  config.vm.synced_folder "web", "/home/vagrant/html"
  config.vm.provision "file", source: "docker-compose.yml", destination: "$HOME/"
  config.vm.hostname="DockerWordpress"
  config.vm.provider "virtualbox" do |vbox|
     vbox.memory = 4096
     vbox.cpus = 2
     vbox.name ="server_wordpress"
  end
  config.vm.provision "shell", path: "docker-install.sh"		    
end