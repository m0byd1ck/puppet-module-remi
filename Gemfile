source 'https://rubygems.org'

if ENV.key?('PUPPET_GEM_VERSION')
  puppetversion = "= #{ENV['PUPPET_GEM_VERSION']}"
else
  puppetversion = ['>= 2.7']
end

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet'
gem 'puppet', puppetversion