# Optional parameters in setting up REMI
class remi::params {

  $os_maj_release = $::os_maj_version
  $os_basearch    = $::architecture

  $remi           = {
    'enabled'    => '1',
    'gpgcheck'   => '1',
    'mirrorlist' => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/remi/mirror",
    'include'    => undef,
    'exclude'    =>undef
  }
  $php55          = {
    'enabled'  => '0',
    'gpgcheck' => '1',
    'baseurl'  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php55/${os_basearch}/",
    'include'  => undef,
    'exclude'  =>undef
  }
  $php56          = {
    'enabled'  => '1',
    'gpgcheck' => '1',
    'baseurl'  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php56/${os_basearch}/",
    'include'  => undef,
    'exclude'  =>undef
  }
  $php70          = {
    'enabled'  => '0',
    'gpgcheck' => '1',
    'baseurl'  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/php70/${os_basearch}/",
    'include'  => undef,
    'exclude'  =>undef
  }
  $test           = {
    'enabled'    => '0',
    'gpgcheck'   => '1',
    'mirrorlist' => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/test/mirror",
    'include'    => undef,
    'exclude'    =>undef
  }
  $debuginfo      = {
    'enabled'  => '0',
    'gpgcheck' => '1',
    'baseurl'  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/debug-remi/${os_basearch}/",
    'include'  => undef,
    'exclude'  =>undef
  }
  $test_debuginfo = {
    'enabled'  => '0',
    'gpgcheck' => '1',
    'baseurl'  => "http://rpms.famillecollet.com/enterprise/${os_maj_release}/debug-test/${os_basearch}/",
    'include'  => undef,
    'exclude'  =>undef
  }

}