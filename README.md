[![Actions Status - Master](https://github.com/juju4/ansible-pystemon/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-pystemon/actions?query=branch%3Amaster)
[![Actions Status - Devel](https://github.com/juju4/ansible-pystemon/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-pystemon/actions?query=branch%3Adevel)

# Pystemon ansible role

Ansible role to setup Pystemon
https://github.com/CIRCL/pystemon/

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.1
 * 2.2
 * 2.5

### Operating systems

Tested Ubuntu 14.04, 16.04, 18.04 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.pystemon
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.pystemon
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.pystemon/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.pystemon/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## Troubleshooting & Known issues


## License

BSD 2-clause
