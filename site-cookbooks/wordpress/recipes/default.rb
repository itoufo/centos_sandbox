#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# vagrant かそうでないかでuser名を変更
wordpress = "latest.tar.gz"

cookbook_file "/home/vagrant/"+wordpress do
  source wordpress
  user user
  group user
  #path "~/#{wordpress}"
end

execute "install wordpress" do
  user user
  group user
  command "tar zxvf /home/vagrant/#{wordpress} -C /usr/share/nginx/html"
  action :run
end
