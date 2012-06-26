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
}

class apache::service {
  service { "httpd":
    name       => apache2,
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

class apache::config {

  apache::module {"rewrite": }
  # apache::module {"mod_status": }

  /*
  # Info directory
  file { "server_info_dir":
    path    => "/var/www/${server_info_dir}/",
    ensure => "directory",
    recurse => true,
    require => Class["apache::install"],
    notify    => Class['apache::service'],
  }
  */
}

class apache {
  include apache::install, apache::service, apache::config
}

/*
  apache::vhost {
    "my-site1.com": port => "80", docroot => "/public_html/mysite1", name => "my-site1";
    "my-site2.com": port => "80", docroot => "/var/www/my-site2", name => "my-site2";
    "my-site3.com": port => "80", docroot => "/var/www/my-site3", name => "my-site3";
  }
*/
