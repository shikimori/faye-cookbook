faye cookbook
================

Installs [Faye](https://github.com/shikimori/faye-server/)

Requirements
============

The dependencies are assumed to be downloaded from the [Chef Supermarket](https://supermarket.chef.io/) cookbook repository.

* [nodejs](https://supermarket.chef.io/cookbooks/nodejs/) cookbook
* [git](https://supermarket.chef.io/cookbooks/git/) cookbook

Usage
=====

```ruby
include_recipe 'faye::default'
```

Then add any attributes below that you will want to change to the defaults you use internally. Specifically you should override `faye.key` at a minimum.
Depending on your use case, you may want to add a recipe in your wrapper cookbook that deals with the web server proxy setup.

Attributes
==========

## General 

* `node['faye']['user'] = "faye"` - user to run faye as, the cookbook will create the user if it does not exist.
* `node['faye']['group'] = "users"` - group used on directory creation.
* `node['faye']['install_method'] = 'deploy_revision'` - method for installing faye: either `package` or `deploy_revision`.

## Configuration

These are configuration parameters that will be passed directly to faye via the init scripts.
Please see the [faye documentation](https://github.com/atmos/faye#configuration) for more details on these attributes.

* `node['faye']['port'] = 9292`
* `node['faye']['key'] = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'`
* `node['faye']['endpoint_path'] = '/faye'`

## Init Style: Systemd

* `node['faye']['systemd']['env_path'] = '/etc/sysconfig'`

## Install Method: Deploy Revision

This install methods installs directly from source. It is highly recommended that if you use this method that you specify a particular `faye.branch` and
your own fork via `faye.repo`. This will minimize impact of changes by upstream that you do not control.

* `node['faye']['path'] = "/srv/faye"` - location where to install faye
* `node['faye']['deploy_user'] = "root"` - user who will run git and own the deployed repo.
* `node['faye']['deploy_group'] = "users"` - group who will own the deployed repo.
* `node['faye']['deploy_migrate'] = false` - do not run `deploy_revision` migrations
* `node['faye']['deploy_action'] = "deploy"` - action to pass to the `deploy_revision` resource.
* `node['faye']['repo'] = "git://github.com/morr/faye-server.git"` - location of the faye git repo.
* `node['faye']['branch'] = "master"` - the branch or tag to clone
