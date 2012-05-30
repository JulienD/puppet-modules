# What does it do?

This repository is a handy set of Puppet modules for managing a LAMP stack, and more. Classes are designed to be easy to re-use.

* Apache 2.2
* PHP 5.3
* -xdebug- TODO
* phpMyAdmin
* MySQL Server
* Drush
* -Git and SVN clients- TODO

<h2>Installation</h2>
<p>To get started with puppet run the following commands to download and install the required packages:</p>
	sudo apt-get update
    sudo apt-get install puppet

<p>Next, clone the Git repository:</p>

    git clone git://github.com/JulienD/puppet-modules.git

<h2>Initialization</h2>

<p>Before you can run Puppet, you must create a file named `settings.pp` in the
`manifests` directory and specify the following :</p>

	$mysql_password  = 'your mysql password'
	$server_info_dir = 'info'

<h2>Creating new puppet module</h2>
<p>To create a new module use this default template.</p>
```
  mkdir –p /puppet_folder/modules/MODULE_NAME/{files,templates,manifests}
  touch /puppet_folder/modules/MODULE_NAME/manifests/init.pp
```