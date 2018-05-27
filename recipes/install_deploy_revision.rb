include_recipe 'faye::default'
include_recipe 'git'

deploy_revision node['faye']['path'] do
  repo node['faye']['repo']
  branch node['faye']['branch']
  user node['faye']['deploy_user']
  group node['faye']['deploy_group']
  action node['faye']['action']
  create_dirs_before_symlink []
  symlink_before_migrate.clear
  purge_before_symlink %w[tmp log]
  symlinks 'tmp' => 'tmp', 'log' => 'log'
  before_restart do
    # this is needed because deploy does a chown -R user.group on @name argument, including the shared directory
    # we need to fix this, as the tmp can only be written to by the www-data user
    # https://github.com/opscode/chef/blob/master/chef/lib/chef/provider/deploy.rb#L233
    execute 'chown-tmp' do
      command "/bin/chown -R #{node['faye']['user']} #{node['faye']['path']}/shared/tmp"
      action :run
    end
  end
  notifies :restart, "service[#{node['faye']['app_name']}]", :delayed
end
