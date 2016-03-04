#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2012, Ares
#
# All rights reserved 
#
package "zsh"

case node[:platform]
  when "centos","redhat","fedora"
    package "figlet"
  else
    package "toilet"
end

include_recipe "git"

execute "git clone git://github.com/robbyrussell/oh-my-zsh.git /home/#{node[:user]}/.oh-my-zsh" do
  creates "/home/#{node[:user]}/.oh-my-zsh"
  group node[:user]
  user node[:user]
end

template "/home/#{node[:user]}/.oh-my-zsh/themes/ares.zsh-theme" do
  source "ares.zsh-theme.erb"
  owner node[:user]
  group node[:user]
end

cookbook_file "/usr/share/figlet/standard.flf" do
  source "standard.flf"
  mode "0644"
end

directory "/home/#{node[:user]}/.oh-my-zsh/custom" do
  owner node[:user]
  group node[:user]
  mode '0755'
end

if node.roles.include?('desktop')
  zsh_plugin 'notes'
end
zsh_plugin 'source_code'

template "/home/#{node[:user]}/.zshrc" do
  source "zshrc.erb"
  owner node[:user]
  group node[:user]
end

template "/root/.zshrc" do
  source "zshrc.erb"
end

[node[:user], 'root'].each do |login|
  user "set zsh as login for #{login}" do
    shell "/bin/zsh"
    username login
  end
end

group "staff" do
  members node[:user]
end
