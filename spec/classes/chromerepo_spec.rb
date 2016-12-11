require 'spec_helper'

describe 'chromerepo', type: :class do
  context 'Fedora with no parameters, 64 bit' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_yumrepo('google-chrome').with_baseurl('http://dl.google.com/linux/chrome/rpm/stable/x86_64') }
    it { is_expected.to contain_yumrepo('google-chrome').with_descr('Google Chrome YUM repository') }
    it { is_expected.to contain_yumrepo('google-chrome').with_enabled('1') }
    it { is_expected.to contain_yumrepo('google-chrome').with_ensure('present') }
    it { is_expected.to contain_yumrepo('google-chrome').with_gpgcheck('1') }
    it { is_expected.to contain_yumrepo('google-chrome').with_gpgkey('http://dl-ssl.google.com/linux/linux_signing_key.pub') }
    it { is_expected.to contain_yumrepo('google-chrome').with_proxy('absent') }
    it { is_expected.to contain_yumrepo('google-chrome').with_repo_gpgcheck('1') }
  end

  context 'Fedora with no parameters, 32 bit' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'i386' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_baseurl('http://dl.google.com/linux/chrome/rpm/stable/i386') }
    it { is_expected.to contain_yumrepo('google-chrome').with_descr('Google Chrome YUM repository') }
    it { is_expected.to contain_yumrepo('google-chrome').with_enabled('1') }
    it { is_expected.to contain_yumrepo('google-chrome').with_ensure('present') }
    it { is_expected.to contain_yumrepo('google-chrome').with_gpgcheck('1') }
    it { is_expected.to contain_yumrepo('google-chrome').with_gpgkey('http://dl-ssl.google.com/linux/linux_signing_key.pub') }
    it { is_expected.to contain_yumrepo('google-chrome').with_proxy('absent') }
    it { is_expected.to contain_yumrepo('google-chrome').with_repo_gpgcheck('1') }
  end

  context 'Fedora with repo baseurl set' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { 'baseurl' => 'http://mirror.domain.com' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_baseurl('http://mirror.domain.com') }
  end

  context 'Fedora with repo description set' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { 'descr' => 'This is a description' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_descr('This is a description') }
  end

  context 'Fedora with repo enabled unset' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { enabled: '0' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_enabled('0') }
  end

  context 'Fedora with gpgcheck unset' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { gpgcheck: '0' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_gpgcheck('0') }
  end

  context 'Fedora with repo_gpgcheck unset' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { repo_gpgcheck: '0' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_repo_gpgcheck('0') }
  end

  context 'Fedora with repo name set' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { repo_name: 'The official Google Chrome repository' } }
    it { is_expected.to contain_yumrepo('The official Google Chrome repository') }
  end

  context 'Fedora with repo proxy set' do
    let(:facts) { { osfamily: 'RedHat', operatingsystem: 'Fedora', architecture: 'x86_64' } }
    let(:params) { { proxy: 'http://proxy.domain.com' } }
    it { is_expected.to contain_yumrepo('google-chrome').with_proxy('http://proxy.domain.com') }
  end

  context 'Ubuntu with no parameters' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    it { is_expected.to contain_class('apt') }
    it { is_expected.to contain_apt__source('google-chrome').with_location('http://dl.google.com/linux/chrome/deb/') }
    it { is_expected.to contain_apt__source('google-chrome').with_release('stable') }
    it { is_expected.to contain_apt__source('google-chrome').with_repos('main') }
    it { is_expected.to contain_apt__source('google-chrome').with_include('src' => false) }
    it { is_expected.to contain_apt__source('google-chrome').with_key('id' => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991', 'source' => 'http://dl-ssl.google.com/linux/linux_signing_key.pub') }
  end

  context 'Ubuntu with location set' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { 'location' => 'http://mirror.domain.com' } }
    it { is_expected.to contain_apt__source('google-chrome').with_location('http://mirror.domain.com') }
  end

  context 'Ubuntu with release set' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { release: 'other' } }
    it { is_expected.to contain_apt__source('google-chrome').with_release('other') }
  end

  context 'Ubuntu with repos set' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { repos: 'contrib' } }
    it { is_expected.to contain_apt__source('google-chrome').with_repos('contrib') }
  end

  context 'Ubuntu with key set' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { key: 'A1234567' } }
    it { is_expected.to contain_apt__source('google-chrome').with_key('id' => 'A1234567', 'source' => 'http://dl-ssl.google.com/linux/linux_signing_key.pub') }
  end

  context 'Ubuntu with key_source set' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { key_source: 'http://keysource.server.domain/key.pub' } }
    it { is_expected.to contain_apt__source('google-chrome').with_key('id' => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991', 'source' => 'http://keysource.server.domain/key.pub') }
  end

  context 'Ubuntu with include_src set to true' do
    let(:facts) { { lsbdistid: 'ubuntu', lsbdistcodename: 'trusty', lsbdistrelease: '14.04', osfamily: 'Debian', architecture: 'x86_64' } }
    let(:params) { { include_src: true } }
    it { is_expected.to contain_apt__source('google-chrome').with_include('src' => true) }
  end

  context 'Unsupported osfamily' do
    let(:facts) { { osfamily: 'Gentoo', operatingsystem: 'Gentoo', architecture: 'x86_64' } }
    it { is_expected.to compile.with_all_deps }
  end
end
