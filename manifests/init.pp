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
    $remi           = $remi::params::remi,
    $php55          = $remi::params::php55,
    $php56          = $remi::params::php56,
    $php70          = $remi::params::php70,
    $test           = $remi::params::test,
    $debuginfo      = $remi::params::debuginfo,
    $test_debuginfo = $remi::params::test_debuginfo,
    $os_maj_release = $remi::params::os_maj_release,
    $os_basearch    = $remi::params::os_basearch,
  ) inherits remi::params {

  require epel

  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

    yumrepo { 'remi':
      descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch}",
      mirrorlist  => $remi['mirrorlist'],
      enabled     => $remi['enabled'],
      gpgcheck    => $remi['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $remi['include'],
      exclude     => $remi['exclude'],
    }

    yumrepo { 'remi-php55':
      descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php55",
      baseurl     => $php55['baseurl'],
      enabled     => $php55['enabled'],
      gpgcheck    => $php55['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $php55['include'],
      exclude     => $php55['exclude'],
    }

    yumrepo { 'remi-php56':
      descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php56",
      baseurl     => $php56['baseurl'],
      enabled     => $php56['enabled'],
      gpgcheck    => $php56['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $php56['include'],
      exclude     => $php56['exclude'],
    }

    yumrepo { 'remi-php70':
          descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - php70",
          baseurl     => $php70['baseurl'],
          enabled     => $php70['enabled'],
          gpgcheck    => $php70['gpgcheck'],
          gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
          includepkgs => $php70['include'],
          exclude     => $php70['exclude'],
    }

    yumrepo { 'remi-test':
      descr       => "remi RPM for Enterprise Linux - ${os_basearch}",
      mirrorlist  => $test['mirrorlist'],
      enabled     => $test['enabled'],
      gpgcheck    => $test['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $test['include'],
      exclude     => $test['exclude'],
    }

    yumrepo { 'remi-debuginfo':
      descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - debuginfo",
      baseurl     => $debuginfo['baseurl'],
      enabled     => $debuginfo['enabled'],
      gpgcheck    => $debuginfo['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $debuginfo['include'],
      exclude     => $debuginfo['exclude'],
    }

    yumrepo { 'remi-test-debuginfo':
      descr       => "remi RPM for Enterprise Linux ${os_maj_release} - ${os_basearch} - debuginfo",
      baseurl     => $test_debuginfo['baseurl'],
      enabled     => $test_debuginfo['enabled'],
      gpgcheck    => $test_debuginfo['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
      includepkgs => $test_debuginfo['include'],
      exclude     => $test_debuginfo['exclude'],
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
