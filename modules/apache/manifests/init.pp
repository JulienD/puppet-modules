# Class: apache
#
# This class installs Apache
#
class apache {

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

  apache::module {"rewrite": }

  # TODO : Faire une boucle pour l"import de plusieurs vhost et utiliser un fichier de settings.
  apache::vhost {
    "my-site1.com": port => "80", docroot => "/var/www/my-site1", name => "my-site1";
    "my-site2.com": port => "80", docroot => "/var/www/my-site2", name => "my-site2";
    "my-site3.com": port => "80", docroot => "/var/www/my-site3", name => "my-site3";
  }


  # Info directory
  file { "server_info_dir":
    path    => "/var/www/info/",
    ensure => "directory",
    recurse => true,
    require => Package["httpd"],
  }
}