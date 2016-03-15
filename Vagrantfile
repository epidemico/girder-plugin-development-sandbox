# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative "config"
include CONFIG

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |vb|
    config.vm.box = "ubuntu-14.04-amd64"
    config.vm.box_url = "https://install.epidemi.co/vagrant-boxes/ubuntu-14.04-amd64.box"
    config.vm.box_download_insecure = true
    config.vm.synced_folder GIRDER_PLUGIN[:local_files_dir], "/usr/local/lib/python2.7/dist-packages/girder/plugins/" + GIRDER_PLUGIN[:girder_folder_name], create: true
    config.vm.network :forwarded_port, guest: 8080, host: 8080
    vb.memory = 4096
  end

  # Provision the box
  config.vm.provision "shell", :path => "provisioning.sh"

  # MOTD thing
  config.vm.provision "postinstall", type: "shell", :inline => <<-SHELL
    echo ""
    echo ""
    echo "***********************************************************************"
    echo "**                                                                   **"
    echo "**  Girder has been built.                                           **" 
    echo "**                                                                   **"
    echo "**  Edit the files in your 'GIRDER_PLUGIN[:local_files_dir]' dir     **"
    echo "**  and see live updates at localhost:8080                           **"
    echo "**                                                                   **"
    echo "***********************************************************************"
    echo ""
    echo ""
  SHELL

  #
  # the location of your private vagrant key
  #
  config.ssh.private_key_path = "~/.ssh/vagrant-insecure"

end
