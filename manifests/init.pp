# == Class: chromerepo
#
# This module installs and enables the official Google Chrome YUM or APT
# repository depending on the osfamily. When run on a non-RedHat or
# non-Debian osfamily it exits with no action performed.
#
# === Parameters
#
# [*chromerepo_baseurl*]
# Defaults to http://dl.google.com/linux/chrome/rpm/stable/{::architecture}
#
# [*chromerepo_descr*]
# Defaults to 'Google Chrome YUM repository'
#
# [*chromerepo_enabled*]
# Defaults to 1
#
# [*chromerepo_gpgcheck*]
# Defaults to 1
#
# [*chromerepo_name*]
# Defaults to google-chrome
#
# [*chromerepo_proxy*]
# Defaults to absent. (Uses the yum.conf value if it exists)
#
# === Usage
#
# include '::chromerepo'
#
# or to use a local mirror:
#
#  class { 'chromerepo':
#    chromerepo_baseurl => 'http://localmirror.server.domain',
#  }
#
class chromerepo (
  $chromerepo_baseurl           = $chromerepo::params::chromerepo_baseurl,
  $chromerepo_descr             = $chromerepo::params::chromerepo_descr,
  $chromerepo_enabled           = $chromerepo::params::chromerepo_enabled,
  $chromerepo_gpgcheck          = $chromerepo::params::chromerepo_gpgcheck,
  $chromerepo_include_src       = $chromerepo::params::chromerepo_include_src,
  $chromerepo_key               = $chromerepo::params::chromerepo_key,
  $chromerepo_key_source        = $chromerepo::params::chromerepo_key_source,
  $chromerepo_location          = $chromerepo::params::chromerepo_location,
  $chromerepo_name              = $chromerepo::params::chromerepo_name,
  $chromerepo_proxy             = $chromerepo::params::chromerepo_proxy,
  $chromerepo_release           = $chromerepo::params::chromerepo_release,
  $chromerepo_repos             = $chromerepo::params::chromerepo_repos,
) inherits chromerepo::params {

  case $::osfamily {
    'RedHat': {
      yumrepo { $chromerepo_name:
        baseurl        => $chromerepo_baseurl,
        descr          => $chromerepo_descr,
        enabled        => $chromerepo_enabled,
        gpgcheck       => $chromerepo_gpgcheck,
        gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome',
        proxy          => $chromerepo_proxy,
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/chromerepo/RPM-GPG-KEY-google-chrome',
      }

      gpg_key{ $chromerepo_name:
        path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome',
        before  => Yumrepo[$chromerepo_name]
      }
    }
    'Debian': {
      include apt
      apt::source { 'google-chrome':
        location    => $chromerepo_location,
        release     => $chromerepo_release,
        repos       => $chromerepo_repos,
        include_src => $chromerepo_include_src,
        key         => $chromerepo_key,
        key_source  => $chromerepo_key_source,
      }
    }
    default: {
      notice ("Your operating system ${::operatingsystem} will not have the Google Chrome repository applied")
    }
  }
}