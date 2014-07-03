####Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
3. [Limitations](#limitations)
4. [Development](#development)

##Overview
This module installs and enables the Google Chrome YUM or APT repository
depending on the osfamily. When run on a non-RedHat or non-Debian osfamily
it exits with no action performed.

[![Build
Status](https://secure.travis-ci.org/juniorsysadmin/puppet-chromerepo.png)](http://travis-ci.org/juniorsysadmin/puppet-chromerepo)

##Usage

```puppet
include  '::chromerepo'
```

or to use a local mirror:

```puppet
class { '::chromerepo':
  chromerepo_baseurl => 'http://localmirror.server.domain',
}
```

###Parameters

The following parameters are available in the chromerepo module:

####`chromerepo_baseurl`

Defaults to http://dl.google.com/linux/chrome/rpm/stable/{::architecture}.

####`chromerepo_enabled`

Defaults to 1.

####`chromerepo_gpgcheck`

Defaults to 1

####`chromerepo_name`

Defaults to adobe-linux-${::architecture}

####`chromerepo_proxy`

Defaults to absent.  (Uses the yum.conf value if it exists)

####`chromerepo_include_src`

Used by apt::source. Defaults to false.

####`chromerepo_key`

Used by apt::source. Defaults to the official Google Chrome repository one.

####`chromerepo_key_source`

Used by apt::source. Defaults to http://dl-ssl.google.com/linux/linux_signing_key.pub

####`chromerepo_location`

Location of Google Chrome repository. Defaults to
http://dl.google.com/linux/chrome/deb/

####`chromerepo_release`

Used by apt::source. Defaults to stable.

####`ubuntuzilla_repos`

Used by apt::source. Defaults to main.

##Limitations

This module has received limited testing on:

* Fedora 20
* Ubuntu 14.04

against Puppet 3.x

##Development

Patches are welcome.