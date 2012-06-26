# Class: apc
#
#   This class installs apc.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class apc::install {
  php::pear::module { "apc":
    repository => "pecl",
  }
}

class apc::config {
  file {
    "apc.ini":
      path    => "/etc/php5/apache2/conf.d/apc.ini",
      content => template('apc/apc.ini.erb'),
      ensure  => present,
      notify  => Class['apache::service'],
      require => [Class['apc::install'], Class['php'], Class['apache']];
    "apc.php":
      path    => "/var/www/apc.php",
      ensure  => present,
      source  => "/usr/share/php/apc.php",
      notify  => Class['apache::service'],
      require => [Class['apc::install'], Class['php']];
  }
}

class apc {
  include apc::params
  include apc::install, apc::config
}

