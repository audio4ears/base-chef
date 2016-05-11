# base-chef

This cookbook installs a base image with common configurations that can be further built upon with more application-specific cookbooks. It can be included as a recipe in your own cookbook or baked into an image as is and sourced for speedier converging purposes.

This cookbook contains the following public cookbooks:

- [auditd](https://supermarket.chef.io/cookbooks/auditd)
- [hostname](https://supermarket.chef.io/cookbooks/hostname)
- [iptables](https://supermarket.chef.io/cookbooks/iptables)
- [ntp](https://supermarket.chef.io/cookbooks/ntp)
- [selinux](https://supermarket.chef.io/cookbooks/selinux)
- [sudo](https://supermarket.chef.io/cookbooks/sudo)
- [sysctl](https://supermarket.chef.io/cookbooks/sysctl)
- [timezone_lwrp](https://supermarket.chef.io/cookbooks/timezone_lwrp)

This cookbook contains the following custom recipes:

- **base**: default cookbook to call for including all settings
- **bash**: custom bash PS1, clear history
- **login_defs**: set ENCRYPT_METHOD to SHA512
- **nfs**: define specific nfs port
- **ssh**: unique ssh server key, ssh config hardening
- **update**: update os via package management

### Chef

To include all configurations provided by this cookbook in your recipe, configure your Berksfile and Metadata.rb accordingly, and include the following:

```ruby
include_recipe base-chef::base
```

### Vagrant

Included with this cookbook is a ```Vagrantfile``` configured with both  ```virtualbox``` and ```aws``` providers. Utilizing chef-zero, these providers can install this cookbook onto either a VM or AMI. To utilize AWS funcationality please update the aws variables within the Vagrantfile prior to launching.

**Virtualbox**

```bash
$ git clone https://github.com/audio4ears/base-chef.git
$ cd base-chef
$ vagrant up --provider virtualbox
```

**AWS**

```bash
$ git clone https://github.com/audio4ears/base-chef.git
$ cd base-chef
$ vagrant up --provider aws
```
