Vagrant::Config.run do |config|
  # Uncomment this line to enable GUI mode
  # config.vm.boot_mode = 'gui'

  config.vm.box = "precise64"
  # taken from vagrantbox.es
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  config.vm.host_name = "ryan"
  config.vm.network :hostonly, "33.33.33.10"

  # install puppet, otherwise it breaks on the sqlite module's metadata
  #config.vm.provision :shell, :path => "bin/update-puppet.sh"

  config.vm.share_folder "www", "/var/www", "./www"

  config.vm.provision :shell, :path => 'bin/apt-update.sh'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "site.pp"
  end

end
