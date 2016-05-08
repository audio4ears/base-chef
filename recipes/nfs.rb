#
# Cookbook Name:: base-chef
# Recipe:: sysconfig_nfs
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template 'set_sysconfig_nfs' do
  path '/etc/sysconfig/nfs'
  source 'properties.erb'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
  variables config: node['sysconfig']['nfs']
end

service 'nfslock' do
  action :restart
end
