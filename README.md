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

# Usage

    include remi

or
    
    class {'remi':
        remi_enabled => '1',
        remi_gpgcheck => '1',
        remi_php56_enabled => '0',
        remi_php56_gpgcheck => '1'
        remi_php70_enabled => '1',
        remi_php70_gpgcheck => '1'
    }

# Futher Information

* [remi website](http://rpms.famillecollet.com/)
* This code base based on code from https://github.com/stahnma/puppet-module-epel and https://github.com/ckhall/puppet-module-remi

# Testing

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

# License
Apache Software License 2.0
