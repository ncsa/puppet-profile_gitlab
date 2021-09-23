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
- [ncsa/sshd](https://github.com/ncsa/puppet-sshd)
- [puppet/gitlab](https://forge.puppet.com/modules/puppet/gitlab)
- [puppetlabs/firewall](https://forge.puppet.com/modules/puppetlabs/firewall)


## Reference

### class profile_gitlab::firewall (
-  Hash[String,String] $http_allowed_subnets,
-  Hash[String,String] $https_allowed_subnets,
### class profile_gitlab::ssh (
-  Array[ String ] $allowed_subnets,

See: [REFERENCE.md](REFERENCE.md)
