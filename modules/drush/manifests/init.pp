# Class: drush
#
#   This class installs drush, the drupal shell tool.
#
# Parameters:
#
# Actions:
#
# Requires:
#    class::php
#
# Sample Usage:
#
class drush::install {

  exec { "drush_pear_discover":
    command => "pear channel-discover pear.drush.org",
    unless  => "pear list-channels | grep 'pear.drush.org'",
    require => Package['php-pear'],
  }

  php::pear::module { "drush":
    #version    => "4.6.0",
    repository => "drush",
    require    => Exec['drush_pear_discover'],
  }
}

class drush::config {
  php::pear::module { "Console_Table":
    require => Class['drush::install'],
  }
}


class drush {
  include php
  include php::pear
  include drush::install, drush::config
}
