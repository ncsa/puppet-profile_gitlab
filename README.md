# profile_gitlab

![pdk-validate](https://github.com/ncsa/puppet-profile_gitlab/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_gitlab/workflows/yamllint/badge.svg)

NCSA Common Puppet Profiles - configure GitLab service

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_gitlab](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Dependencies](#dependencies)
1. [Reference](#reference)


## Description

This puppet profile customizes a host to install and configure GitLab service


## Setup

Include profile_gitlab in a puppet profile file:
```
include ::profile_gitlab
```


## Usage

The goal is that no paramters are required to be set. The default paramters should work for most NCSA deployments out of the box.


## Dependencies

- [ncsa/pam_access](https://github.com/ncsa/puppet-pam_access)
- [ncsa/profile_backup](https://github.com/ncsa/puppet-profile_backup)
- [ncsa/sshd](https://github.com/ncsa/puppet-sshd)
- [puppet/gitlab](https://forge.puppet.com/modules/puppet/gitlab)
- [puppet/rsyslog](https://forge.puppet.com/modules/puppet/rsyslog)
- [puppetlabs/firewall](https://forge.puppet.com/modules/puppetlabs/firewall)


## Reference

See: [REFERENCE.md](REFERENCE.md)
