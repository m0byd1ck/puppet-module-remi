# Optional parameters in setting up REMI
class remi::params {

  $os_maj_release = $::os_maj_version
  $os_basearch    = $::architecture

  $remi_enable                   = '1'
  $remi_gpgcheck                 = '1'
  $remi_php55_enable             = '0'
  $remi_php55_gpgcheck           = '1'
  $remi_php56_enable             = '1'
  $remi_php56_gpgcheck           = '1'
  $remi_php70_enable             = '0'
  $remi_php70_gpgcheck           = '1'
  $remi_test_enable              = '0'
  $remi_test_gpgcheck            = '1'
  $remi_debuginfo_enable         = '0'
  $remi_debuginfo_gpgcheck       = '1'
  $remi_test_debuginfo_enable    = '0'
  $remi_test_debuginfo_gpgcheck  = '1'

}