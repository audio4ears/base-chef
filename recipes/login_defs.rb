#
# Cookbook Name:: base-chef
# Recipe:: login_defs
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template 'create_login_defs' do
  path '/etc/login.defs'
  source 'login_defs.erb'
  owner 'root'
  group 'root'
  mode '0444'
  action :create
  variables config: node['login_defs']
end
