# Class: memcache
#
#   This class installs memcache.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class memcache::install {

  package {'memcached':
    ensure => present,
  }

  service { 'memcached':
    enable => true,
    ensure => running,
    require => Package['memcached']
  }
}

class memcache {
  include memcache::install
}