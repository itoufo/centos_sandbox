#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# vagrant かそうでないかでuser名を変更
file_name = "latest.tar.gz"
user = "vagrant"
path = "/home/#{user}/#{file_name}"

cookbook_file path do
  source file_name
  user user
  group user
  path path
end

execute "install wordpress" do
  user user
  group user
  command "sudo tar zxvf #{path} -C /usr/share/nginx/html"
  action :run
end
