#
# Cookbook Name:: base-chef
# Recipe:: ssh_moduli
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# enforce secure dh group moduli bit range
execute 'truncate_ssh_dh_moduli' do
  command <<-EOF
    awk '$5 > 2000' /etc/ssh/moduli > /tmp/moduli && \
    wc -l /tmp/moduli && \
    mv /tmp/moduli /etc/ssh/moduli
    EOF
  user 'root'
  only_if { ::File.exists?('/etc/ssh/moduli') }
end

# generate secure dh group moduli file if missing
execute 'generate_ssh_dh_moduli' do
  command <<-EOF
    ssh-keygen -G /etc/ssh/moduli.all -b 4096 && \
    ssh-keygen -T /etc/ssh/moduli.safe -f /etc/ssh/moduli.all && \
    mv /etc/ssh/moduli.safe /etc/ssh/moduli && \
    rm /etc/ssh/moduli.all
    EOF
  user "root"
  not_if { ::File.exists?("/etc/ssh/moduli") }
end

# generate host spcific ssh key
chef_gem 'digest' do
  action :install
end

require 'digest'

execute "generate_ssh_host_key" do
  command <<-EOF
    rm /etc/ssh/ssh_host_rsa_key && \
    rm /etc/ssh/ssh_host_rsa_key.pub && \
    ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -q -N "" && \
    chmod 600 /etc/ssh/ssh_host_rsa_key
    EOF
  user "root"
  only_if { ( ::Digest::SHA2.file('/etc/ssh/ssh_host_rsa_key.pub').hexdigest.eql?("d53b22616fd9fc744498f01e141d4c8ba07436f7d0b5b17b9a01a7e12f80e7b8") || !::File.exists?("/etc/ssh/ssh_host_rsa_key") ) }
end

# update sshd_config 
template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  group 'root'
  mode '640'
  action :create
end

# restart ssh
service 'sshd' do
  action :restart
end
