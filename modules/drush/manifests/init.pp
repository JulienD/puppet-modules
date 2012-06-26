# Class: drush
#
#   This class installs drush, the drupal shell tool.
#
# Parameters:
#
# Actions:
#    Installation of drush and Console_Tab
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
    version    => "5.2.0",
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
