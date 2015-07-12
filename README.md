# chromerepo

[![Build Status](https://secure.travis-ci.org/juniorsysadmin/puppet-chromerepo.png)](http://travis-ci.org/juniorsysadmin/puppet-chromerepo)

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Parameters](#parameters)
1. [Limitations](#limitations)
    * [Module dependencies](#modules-dependencies)
1. [Development](#development)

## Overview

This module installs and enables the Google Chrome YUM or APT repository
depending on the osfamily. When run on a non-RedHat or non-Debian osfamily
it exits with no action performed.

## Usage

```puppet
include  '::chromerepo'
```

Or to use a local mirror for Fedora:

```puppet
class { '::chromerepo':
  chromerepo_baseurl => 'http://localmirror.server.domain',
}
```

Or to use a local mirror for Ubuntu:

```puppet
class { '::chromerepo':
  chromerepo_location => 'http://localmirror.server.domain/',
}
```

### Parameters

The following parameters are available in the chromerepo module:

#### `baseurl`

Used by yumrepo. Defaults to
http://dl.google.com/linux/chrome/rpm/stable/{::architecture}.

#### `descr`

Used by yumrepo. Defaults to 'Google Chrome YUM repository'

#### `enabled`

Used by yumrepo. Defaults to 1.

#### `gpgcheck`

Used by yumrepo. Defaults to 1

#### `include_src`

Used by apt::source. Defaults to false.

#### `key`

Used by apt::source. Defaults to the official Google Chrome repository one.

#### `key_source`

Used by apt::source and yurepo. Defaults to
http://dl-ssl.google.com/linux/linux_signing_key.pub

#### `location`

Location of Google Chrome repository for Debian. Defaults to
http://dl.google.com/linux/chrome/deb/

#### `repo_name`

Used by yumrepo. Defaults to 'google-chrome'

#### `proxy`

Defaults to absent.  (Uses the yum.conf value if it exists)

#### `release`

Used by apt::source. Defaults to stable.

#### `repo_gpgcheck`

Used by yumrepo. Defaults to 1

#### `repos`

Used by apt::source. Defaults to main.

## Limitations

This module has received limited testing on:

* Fedora 22
* Ubuntu 14.04

against Puppet 3.x and Puppet 4.x

### Module dependencies

This modules uses `puppetlabs-apt` for the management of the Google
repository. If using an operating system of the Debian-based family, you will
need to ensure that `puppetlabs-apt` version 2.x is installed.

## Development

Patches are welcome.
