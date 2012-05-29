Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"] }
File { owner => 'root', group => 'root' }


# Classes definitions are managed by the main class Stage instead of include
# them via the include command (ex : include php).
# The class Stages is a method to control the ordering of resource management
# in puppet. This provides the ability to associate a class to a single stage
# and Puppet will guarantee stages run in a specific predictable order every
# catalog run.

# Three levels of order are available (first / main / last).
stage { "first": before => Stage["main"] }
stage { "last": require => Stage["main"] }

import "settings"

# To execute your provisioning you just have to implement them and defining the
# stage orders.
class {
  "bootstrap":  stage => first;
  "tools": 	    stage => main;
  "apache":     stage => main;
  "php":  	    stage => main;
  "mysql":      stage => main;
  "phpmyadmin": stage => last;
  "drush":		stage => last;
}



