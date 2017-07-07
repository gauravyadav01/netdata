#set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
begin
  servers = YAML.load_file('servers.yaml')
rescue
  puts "Create a servers.yaml file in current direcory"
  message = <<-EOF
---
- name: coreos-01
  box: coreos-alpha
  ip: 172.17.8.101
EOF
  puts message
  exit 1
end

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.hostname = servers["name"] + ".local"
      srv.vm.box = servers["box"] || "bento/centos-7.3"
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["memory"] || 1024
        vb.cpus = servers["cpu"] || 1
      end
    srv.vm.provision "shell", path: servers["script"]
    end


  end
end
