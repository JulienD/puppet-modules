# Class: tools
#
#   This class installs other usefull packages.
#
class tools::install {

  $packages = [ "curl", "wget", "vim" ]

  package { $packages:
    ensure => present,
  }
}

class tools {
  include tools::install
}