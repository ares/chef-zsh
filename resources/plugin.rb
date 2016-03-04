property :name, :kind_of => String, :name_property => true

default_action :install

action :install do
  template "/home/#{node[:user]}/.oh-my-zsh/custom/#{new_resource.name}.plugin.zsh" do
    source "#{new_resource.name}.plugin.zsh.erb"
    mode "0644"
    owner node[:user]
    group node[:user]
  end
end
