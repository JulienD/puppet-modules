# Class: apache
#
#   This class installs apache.
#
# Parameters:
#
# Requires:
#
# Sample Usage:
#
class apache::install {

  package { "httpd":
    name   => apache2,
    ensure => present,
  }

  service { "httpd":
    name      => apache2,
    ensure    => running,
    enable    => true,
    subscribe => Package["httpd"],
  }
}

class apache::config {

  apache::module {"rewrite": }

  # Info directory
  file { "server_info_dir":
    path    => "/var/www/${server_info_dir}/",
    ensure => "directory",
    recurse => true,
    require => Class["apache::install"],
  }
}

class apache {
  include apache::install, apache::config
}

/*
  apache::vhost {
    "my-site1.com": port => "80", docroot => "/var/www/my-site1", name => "my-site1";
    "my-site2.com": port => "80", docroot => "/var/www/my-site2", name => "my-site2";
    "my-site3.com": port => "80", docroot => "/var/www/my-site3", name => "my-site3";
  }
*/