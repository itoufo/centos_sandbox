#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_service 'default' do
  port '3306'
  version '5.7'
  initial_root_password 'walker73i10'
  action [:create, :start]
end

mysql_config 'hello' do
  instance 'default'
  source 'hello.cnf.erb'
  version '5.7'
  action :create
end


mysql_client 'default' do
  action :create
end
