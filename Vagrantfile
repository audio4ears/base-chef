# -*- mode: ruby -*-
# vi: set ft=ruby :

# variables
$vm_name = 'base-chef'
$vm_box = 'centos-7.2'
$vm_username = 'vagrant'
$vm_password = 'vagrant'
$vm_memory = 2048
$vm_cpu = 2
# aws override variables
$aws_box = "dummy"
$aws_box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
$aws_ami ='ami-6d1c2007'
$aws_region = 'us-east-1'
$aws_instance_type = 't2.small'
$aws_username = "centos"
$aws_private_key_path = ENV['AWS_KEYPATH']
$aws_keypair_name = ENV['AWS_KEYNAME']
$aws_access_key_id = ENV['AWS_KEY']
$aws_secret_access_key = ENV['AWS_SECRET']

Vagrant.configure("2") do |config|
  config.vm.box = $vm_box
  config.vm.box_url = $vm_box_url
  config.vm.communicator = "ssh"
  config.ssh.pty = true
  config.berkshelf.enabled = true
  config.omnibus.chef_version = '12.9.41'

  # port forwarding
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true

  # virtualbox
  config.vm.provider :virtualbox do |vbox, override|
      override.ssh.username = $vm_username
      override.ssh.password = $vm_password
      override.vm.hostname = $vm_name
      vbox.name = $vm_name
      vbox.gui = false
      vbox.customize ["modifyvm", :id, "--memory", $vm_memory]
      vbox.customize ["modifyvm", :id, "--cpus", $vm_cpu]
      vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vbox.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
  end

  # aws
  config.vm.provider :aws do |aws, override|
      override.vm.box = $aws_box
      override.vm.box_url = $aws_box_url
      override.ssh.username = $aws_username
      override.ssh.private_key_path = $aws_private_key_path
      aws.tags = { 'Name' => $vm_name }
      aws.access_key_id = $aws_access_key_id
      aws.secret_access_key = $aws_secret_access_key
      aws.keypair_name = $aws_keypair_name
      aws.ami = $aws_ami
      aws.region = $aws_region
      aws.instance_type = $aws_instance_type
      aws.subnet_id = "subnet-855c8cb8"
      aws.user_data = "#!/bin/bash\nsed -i -e 's/^Defaults.*requiretty/# Defaults requiretty/g' /etc/sudoers"
  end

  # chef-zero
  config.vm.provision :chef_zero do |chef|
      chef.cookbooks_path = "."
      chef.nodes_path = "."
      chef.add_recipe 'base-chef::base'
      chef.json = {
        'dev_mode' => true,
        'ssh' => {
          'allow_users' => [ 'root', 'vagrant', 'centos' ]
        },
        'authorization' => {
          'sudo' => {
            'users' => [ 'vagrant', 'centos' ]
          }
        }
      }
  end
end
