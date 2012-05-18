class tools {

  $packages = ["curl", "wget", "vim"]

  package { $packages:
    ensure => present,
  }
}
