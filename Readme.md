<h2>Initialization</h2>

<p>Before you can run Puppet, you must create a file named settings.pp in the
manifests directory and specify the following :</p>

<code>
$mysql_password  = 'secret'
$server_info_dir = 'info'
<code>

<h2>Creating new puppet module</h2>
To create a new module use this default template
<code>
  mkdir –p /puppet_folder/modules/MODULE_NAME/{files,templates,manifests}
  touch /puppet_folder/modules/MODULE_NAME/manifests/init.pp
</code>