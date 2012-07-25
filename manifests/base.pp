Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"] }
# File { owner => 'root', group => 'root' }
group { "puppet": ensure => "present"}

import "settings"

# Ensure that packages are up to date before beginning.
exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}
Package {
  require => Exec["apt-get update"]
}
File {
  require => Exec["apt-get update"]
}

include tools
include apache
include php
#include apc
include mysql
include phpmyadmin
#include drush
#include git
#include mongodb
