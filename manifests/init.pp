# Class remi
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Requires:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, et al)
#
# Dependencies:
#   stahnma/epel module, version: '1.0.2'
#
# Sample Usage:
#   include remi
#

class remi (
    $remi_enable                   = $remi::params::remi_enable,
    $remi_gpgcheck                 = $remi::params::remi_gpgcheck,
    $remi_php55_enable             = $remi::params::remi_php55_enable,
    $remi_php55_gpgcheck           = $remi::params::remi_php55_gpgcheck,
    $remi_php56_enable             = $remi::params::remi_php56_enable,
    $remi_php56_gpgcheck           = $remi::params::remi_php56_gpgcheck,
    $remi_php70_enable             = $remi::params::remi_php70_enable,
    $remi_php70_gpgcheck           = $remi::params::remi_php70_gpgcheck,
    $remi_test_enable              = $remi::params::remi_test_enable,
    $remi_test_gpgcheck            = $remi::params::remi_test_gpgcheck,
    $remi_debuginfo_enable         = $remi::params::remi_debuginfo_enable,
    $remi_debuginfo_gpgcheck       = $remi::params::remi_debuginfo_gpgcheck,
    $remi_test_debuginfo_enable    = $remi::params::remi_test_debuginfo_enable,
    $remi_test_debuginfo_gpgcheck  = $remi::params::remi_test_debuginfo_gpgcheck,
    $os_maj_release                = $remi::params::os_maj_release,
    $os_basearch                   = $remi::params::os_basearch,
  ) inherits remi::params {

  require epel

  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

    yumrepo { 'remi':
      descr      => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch}",
      mirrorlist => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/remi/mirror",
      enabled    => $remi_enable,
      gpgcheck   => $remi_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    yumrepo { 'remi-php55':
      descr    => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php55",
      baseurl  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php55/${os_basearch}/",
      enabled  => $remi_php55_enable,
      gpgcheck => $remi_php55_gpgcheck,
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    yumrepo { 'remi-php56':
      descr    => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php56",
      baseurl  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php56/${os_basearch}/",
      enabled  => $remi_php56_enable,
      gpgcheck => $remi_php56_gpgcheck,
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    yumrepo { 'remi-php70':
          descr    => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php70",
          baseurl  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php70/${os_basearch}/",
          enabled  => $remi_php70_enable,
          gpgcheck => $remi_php70_gpgcheck,
          gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
        }

    yumrepo { 'remi-test':
      descr      => "remi RPM for Enterprise Linux - ${os_basearch}",
      mirrorlist => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/test/mirror",
      enabled    => $remi_test_enable,
      gpgcheck   => $remi_test_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    yumrepo { 'remi-debuginfo':
      descr    => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - debuginfo",
      baseurl  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/debug-remi/${os_basearch}/",
      enabled  => $remi_debuginfo_enable,
      gpgcheck => $remi_debuginfo_gpgcheck,
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    yumrepo { 'remi-test-debuginfo':
      descr    => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - debuginfo",
      baseurl  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/debug-test/${os_basearch}/",
      enabled  => $remi_test_debuginfo_enable,
      gpgcheck => $remi_test_debuginfo_gpgcheck,
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/remi/RPM-GPG-KEY-remi',
    }

    remi::rpm_gpg_key{ 'remi':
      path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      before => yumrepo['remi','remi-php55','remi-php56','remi-php70','remi-test','remi-debuginfo', 'remi-test-debuginfo'],
    }
  } else {
      notice ("Your operating system ${::operatingsystem} will not have the REMI repository applied")
  }
}
