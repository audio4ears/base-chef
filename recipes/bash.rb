#
# Cookbook Name:: base-chef
# Recipe:: bash
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file 'set_bash_defaults' do
  path '/etc/profile.d/bash_defaults.sh'
  source 'bash_defaults.sh'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file 'set_bash_timeout' do
  path '/etc/profile.d/bash_timeout.sh'
  source 'bash_timeout.sh'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
