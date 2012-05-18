# Class: bootstrap
#
# This class is run at first to initialize the configuration of the server and before modules provisionnement.
#
class bootstrap {

  group { "puppet":
    ensure => "present",
  }

  # Ensure that packages are up to date before beginning.
  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
  }
  Package {
    require => Exec["apt-get update"]
  }
  File {
    require => Exec["apt-get update"]
  }
}