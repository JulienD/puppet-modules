# Actions:
# - Install Apache Virtual Hosts
#
# Sample Usage:
#  apache::module { "module_name": status => "enable"}
#
define apache::module ($status="enable") {
  exec { "/usr/sbin/a2enmod $name" :
  	unless  => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
  	require => Package["httpd"],
  	notify  => Service["httpd"],
  }
}