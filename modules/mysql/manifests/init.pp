# Class: mysql
#
#   This class installs mysql.
#
class mysql::install {
  $packages = ["mysql-server", "mysql-common", "mysql-client", "mytop"]
  package { $packages:
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }
}

class mysql::config {
  exec { "set-mysql-password":
    unless  => "mysqladmin -uroot -p$mysql_password status",
    command => "mysqladmin -uroot password $mysql_password",
    require => Class["mysql::install"],
  }

  file { "mycnf":
    path    => "/etc/mysql/my.cnf",
    source  => "puppet:///modules/mysql/my.cnf",
    owner => 'root',
    group => 'root',
    require => Class["mysql::install"],
  }
}

class mysql {
  include mysql::install, mysql::config
}