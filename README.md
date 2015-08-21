# Configure remi repository

# About
This module basically just mimics the remi-release rpm.

The following repo will be setup and enabled by default:

  * remi
  * remi-php56

Other repositories that will setup but disabled

  * remi-php55
  * remi-php70
  * remi-debuginfo
  * remi-test
  * remi-test-debuginfo

# Simple Usage

    include remi

# Advanced Usage
    
    class {'remi':
        remi           = [
            'enabled'    => '1',
            'gpgcheck'   => '1',
            'mirrorlist' => "http://rpms.famillecollet.com/enterprise/7/remi/mirror",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ]
          php55          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php55/x86_64/",
            'include'  => ['package1', 'package*', 'package?'],
            'exclude'  => ['package1', 'package*', 'package?']
          ]
          php56          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php56/x86_64/",
            'include'  => ['package1', 'package*', 'package?'],
            'exclude'  => ['package1', 'package*', 'package?']
          ]
          php70          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php70/x86_64/",
            'include'  => ['package1', 'package*', 'package?'],
            'exclude'  => ['package1', 'package*', 'package?']
          ]
          test           = [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'mirrorlist' => "http://rpms.famillecollet.com/enterprise/7/test/mirror",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ]
          debuginfo      = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/debug-remi/x86_64/",
            'include'  => ['package1', 'package*', 'package?'],
            'exclude'  => ['package1', 'package*', 'package?']
          ]
          test_debuginfo = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/debug-test/x86_64/",
            'include'  => ['package1', 'package*', 'package?'],
            'exclude'  => ['package1', 'package*', 'package?']
          ]
    }

# Futher Information

* [remi website](http://rpms.famillecollet.com/)

# Testing

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

# License
Apache Software License 2.0
