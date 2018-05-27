include_recipe 'nodejs'

user node['faye']['user']

directory node['faye']['path'] do
  owner node['faye']['deploy_user']
  group node['faye']['deploy_group']
  mode '0775'
  action :create
end

directory "#{node['faye']['path']}/shared" do
  owner node['faye']['deploy_user']
  group node['faye']['deploy_group']
  mode '0775'
  action :create
end

directory "#{node['faye']['path']}/shared/log" do
  owner node['faye']['user']
  group node['faye']['group']
  mode '0775'
  action :create
end

directory "#{node['faye']['path']}/shared/tmp" do
  owner node['faye']['user']
  group node['faye']['group']
  mode '0775'
  action :create
end

include_recipe 'faye::install_deploy_revision'
include_recipe 'faye::init_systemd'
