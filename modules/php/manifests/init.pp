# Class: php
#
# This class installs Php
# 
class php {

  $packages = ["libapache2-mod-php5", "php5", "php5-cli", "php5-mysql", "php5-curl", "php5-dev", "php5-mcrypt", "php5-gd", "libpcre3-dev"]

  package { $packages:
    ensure => present,
  }

  file { 
    "php_a2_ini":
      path => "/etc/php5/apache2/php.ini",
      ensure => present,
      source => "puppet:///modules/php/php_a2.ini",
      owner => 'root',
      group => 'root',
      require => Package['php5', 'libapache2-mod-php5'];
    
    "php_cli_ini":
      path => "/etc/php5/cli/php.ini",
      ensure => present,
      source => "puppet:///modules/php/php_cli.ini",
      owner => 'root',
      group => 'root',
      require => Package['php5', 'php5-cli'];

    "phpinfo":
      path    => "/var/www/info/index.php",
      content => "<?php phpinfo(); ?>",
      ensure  => present,
      notify  => Package['php5'],
      require => File['server_info_dir'];  
  }
}