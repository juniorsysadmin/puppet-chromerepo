class chromerepo::params {
  $baseurl     = "http://dl.google.com/linux/chrome/rpm/stable/${::architecture}"
  $descr       = 'Google Chrome YUM repository'
  $enabled     = '1'
  $gpgcheck    = '1'
  $include_src = false
  $key         = '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991'
  $key_source  = 'http://dl-ssl.google.com/linux/linux_signing_key.pub'
  $location    = 'http://dl.google.com/linux/chrome/deb/'
  $repo_name   = 'google-chrome'
  $proxy       = 'absent'
  $release     = 'stable'
  $repos       = 'main'
}
