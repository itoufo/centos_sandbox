#
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'php-fpm::install'
include_recipe 'php-fpm::configure'

%w{php php-cgi php-cli php-mysql php-gd php-fpm}.each do |pkg|
  package pkg do
    action :install
  end
end

service "php-fpm" do
  supports :restart => true
  action [ :enable, :restart ]
end
