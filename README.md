# Puppet Remi Module

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with remi module](#beginning-with-remi-module)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)
6. [Further Information](#further-information)

## Description

This module will install the remi repository

The following repos will be setup and enabled by default:

  * remi
  * remi-php56

Other repositories that will setup but disabled

  * remi-php55
  * remi-php70
  * remi-debuginfo
  * remi-test
  * remi-test-debuginfo

## Setup

### Setup Requirements

Requires stahnma/epel module

### Beginning with remi module	

    include remi
    
## Usage

    class {'remi':
        remi           = [
            'enabled'    => '1',
            'gpgcheck'   => '1',
            'mirrorlist' => "http://rpms.famillecollet.com/enterprise/7/remi/mirror",
            'include'    => ['package1', 'package*'],
            'exclude'    => ['package1', 'package*']
          ],
          php55          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php55/x86_64/",
            'include'  => ['package1', 'package*'],
            'exclude'  => ['package1', 'package*']
          ],
          php56          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php56/x86_64/",
            'include'  => ['package1', 'package*'],
            'exclude'  => ['package1', 'package*']
          ],
          php70          = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/php70/x86_64/",
            'include'  => ['package1', 'package*'],
            'exclude'  => ['package1', 'package*']
          ],
          test           = [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'mirrorlist' => "http://rpms.famillecollet.com/enterprise/7/test/mirror",
            'include'    => ['package1', 'package*'],
            'exclude'    => ['package1', 'package*']
          ],
          debuginfo      = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/debug-remi/x86_64/",
            'include'  => ['package1', 'package*'],
            'exclude'  => ['package1', 'package*']
          ],
          test_debuginfo = [
            'enabled'  => '0',
            'gpgcheck' => '1',
            'baseurl'  => "http://rpms.famillecollet.com/enterprise/7/debug-test/x86_64/",
            'include'  => ['package1', 'package*'],
            'exclude'  => ['package1', 'package*']
          ]
    }

## Limitations

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

## Development

Please create a pull request via GitHub

## Further Information

* [remi website](http://rpms.famillecollet.com/)