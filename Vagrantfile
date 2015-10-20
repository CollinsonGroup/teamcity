# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "williamyeh/ubuntu-trusty64-docker"
  config.vm.network "forwarded_port", guest: 8111, host: 8111

  config.vm.post_up_message = "Switch to /vagrant for project files. Refer to the readme for build and run commands."
end
