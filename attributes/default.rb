default['faye']['app_name'] = 'faye'
default['faye']['path'] = '/srv/faye'
default['faye']['user'] = 'faye'
default['faye']['group'] = 'users'
default['faye']['systemd']['env_path'] = value_for_platform(
  %w[ubuntu debian] => {
    'default' => '/etc/default'
  },
  %w[centos rhel] => {
    'default' => '/etc/sysconfig'
  }
)

# config
default['faye']['port'] = 9292
default['faye']['key'] = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
default['faye']['endpoint_path'] = '/faye'
