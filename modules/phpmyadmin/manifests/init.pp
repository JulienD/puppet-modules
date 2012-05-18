#
# Installation de phpmyadmin
#
class phpmyadmin {
    package { "phpmyadmin" :
        ensure => present,
        require => Package["mysql-server", "php5"],
    }

    file { [ "/etc/apache2/sites-enabled/phpmyadmin" ] :
        ensure => link,
        target => "/etc/phpmyadmin/apache.conf",
        require => Package["phpmyadmin", "httpd"],
    }

    exec { "sudo apache2ctl graceful" :
        path => "/usr/bin:/usr/sbin:/bin",
        require => Package["httpd"],
    }
}