# Class: apache
#
#   This class installs apache.
#
class apache::install {

  package { "httpd":
    name   => apache2,
    ensure => present,
  }
}

class apache::service {
  service { "httpd":
    name       => apache2,
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

class apache::config {

  apache::module { "rewrite": }

  file {
    "public_html":
      path   => "/home/vagrant/public_html/",
      ensure  => "directory";

    "public_html_symlink":
      path   => "/home/vagrant/public_html",
      ensure => "link",
      target => "/home/vagrant/public/public_html",
      require => File["public_html"];

    "server_info_dir":
      path    => "/var/www/${server_info_dir}/",
      ensure  => "directory",
      recurse => true,
      require => Class["apache::install"];
  }
}

class apache {
  include apache::install, apache::service, apache::config
}
