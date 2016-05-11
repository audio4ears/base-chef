#
# Cookbook Name:: base-chef
# Recipe:: base
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe "#{cookbook_name}::update"
include_recipe 'hostname'
include_recipe 'timezone_lwrp'
include_recipe 'ntp'
include_recipe 'sudo'
include_recipe 'selinux'
include_recipe 'iptables::disabled'
include_recipe 'auditd'
include_recipe 'sysctl'
include_recipe "#{cookbook_name}::bash"
include_recipe "#{cookbook_name}::ssh"
include_recipe "#{cookbook_name}::nfs"
include_recipe "#{cookbook_name}::login_defs"
