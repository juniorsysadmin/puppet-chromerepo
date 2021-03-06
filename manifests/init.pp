class chromerepo (
  $baseurl       = $chromerepo::params::baseurl,
  $descr         = $chromerepo::params::descr,
  $enabled       = $chromerepo::params::enabled,
  $gpgcheck      = $chromerepo::params::gpgcheck,
  $include_src   = $chromerepo::params::include_src,
  $key           = $chromerepo::params::key,
  $key_source    = $chromerepo::params::key_source,
  $location      = $chromerepo::params::location,
  $repo_name     = $chromerepo::params::repo_name,
  $proxy         = $chromerepo::params::proxy,
  $release       = $chromerepo::params::release,
  $repo_gpgcheck = $chromerepo::params::repo_gpgcheck,
  $repos         = $chromerepo::params::repos,
) inherits chromerepo::params {

  case $::osfamily {
    'RedHat': {
      yumrepo { $repo_name:
        ensure        => present,
        baseurl       => $baseurl,
        descr         => $descr,
        enabled       => $enabled,
        gpgcheck      => $gpgcheck,
        gpgkey        => $key_source,
        proxy         => $proxy,
        repo_gpgcheck => $repo_gpgcheck,
      }
    }
    'Debian': {
      ensure_packages(['apt-transport-https', 'ca-certificates'])

      include ::apt
      apt::source { 'google-chrome':
        include  => {
          'src' => $include_src,
        },
        key      => {
          'id'     => $key,
          'source' => $key_source,
        },
        location => $location,
        release  => $release,
        repos    => $repos,
        require  => [
          Package['apt-transport-https'],
          Package['ca-certificates'],
        ],
      }
    }
    'Suse': {
      yumrepo { $repo_name:
        ensure        => present,
        baseurl       => $baseurl,
        descr         => $descr,
        enabled       => $enabled,
        gpgcheck      => $gpgcheck,
        gpgkey        => $key_source,
        proxy         => $proxy,
        repo_gpgcheck => $repo_gpgcheck,
      }
    }
    default: {
      notice ("Your operating system ${::operatingsystem} will not have the Google Chrome repository applied")
    }
  }
}
