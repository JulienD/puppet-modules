# Class: phpmyadmin
#
#   This class installs phpmyadmin software.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class phpmyadmin::install {
  package { "phpmyadmin" :
    ensure => present,
    require => Class["mysql", "php"],
  }
}

class phpmyadmin::config {
  file { "a2en_phpmyadmin":
    name    => "/etc/apache2/sites-enabled/phpmyadmin",
    ensure  => link,
    target  => "/etc/phpmyadmin/apache.conf",
    require => Class["phpmyadmin::install"],
  }

  exec { "sudo apache2ctl graceful" :
    require => File["a2en_phpmyadmin"],
  }
}

class phpmyadmin {
  include phpmyadmin::install, phpmyadmin::config
}