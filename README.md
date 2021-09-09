# profile_gitlab

![pdk-validate](https://github.com/ncsa/puppet-profile_gitlab/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_gitlab/workflows/yamllint/badge.svg)

NCSA Common Puppet Profiles - configure GitLab service

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_gitlab](#setup)
    * [What profile_gitlab affects](#what-profile_gitlab-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with profile_gitlab](#beginning-with-profile_gitlab)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This puppet profile customizes a host to install and configure GitLab service

## Setup

Include profile_gitlab in a puppet profile file:
```
include ::profile_gitlab
```

## Usage

The goal is that no paramters are required to be set. The default paramters should work for most NCSA deployments out of the box.

## Reference

See: [REFERENCE.md](REFERENCE.md)

## Limitations

n/a

## Development

This Common Puppet Profile is managed by NCSA for internal usage.
