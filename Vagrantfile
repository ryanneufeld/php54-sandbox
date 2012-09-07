Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.host_name = "php54"
  # taken from vagrantbox.es
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :bridged
  config.vm.share_folder "www", "/var/www", "./www"

  # install puppet's requirements, otherwise it breaks on makeing a mysql password
  config.vm.provision :shell, :path => "bin/require-before-puppet.sh"

  # install puppet, otherwise it breaks on the sqlite module's metadata
  config.vm.provision :shell, :path => "bin/update-puppet.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "site.pp"
  end
end