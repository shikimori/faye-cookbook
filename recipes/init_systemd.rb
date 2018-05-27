template "#{node['faye']['systemd']['env_path']}/faye" do
  source 'faye.env.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[faye]'
end

template '/etc/systemd/system/faye.service' do
  source 'faye.service.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[faye]'
end

service 'faye' do
  provider Chef::Provider::Service::Systemd
  action %i[start enable]
end
