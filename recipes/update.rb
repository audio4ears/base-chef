#
# Cookbook Name:: base-chef
# Recipe:: update
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

bash 'update_os' do
  case node['platform_family']
  when 'debian'
    code 'apt-get update -y'
  when 'rhel'
    code 'yum update -y'
  end
  action :run
end
