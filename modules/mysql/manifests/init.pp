# Class: mysql
#
#   This class installs mysql.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
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
    require => Class["mysql::install"],
  }
}

/*
#Create MySQL database and user
  define mysqldb( $user, $password ) {
    exec { "create-${name}-db":
      path => ["/usr/bin"],
      unless => "mysql -u${user} -p${password} ${name}",
      command => "mysql -uroot -p$mysql_password -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysqld"],
    }
  }
}

  mysqldb { "myapp": user => "myappuser", password => "5uper5secret" }
*/

class mysql {
  include mysql::install, mysql::config
}