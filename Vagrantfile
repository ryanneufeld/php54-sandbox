Vagrant::Config.run do |config|
  config.vm.box = "squeeze64"
  config.vm.host_name = "php54"
  # taken from vagrantbox.es
  config.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/Squeeze64.box"
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.share_folder "www", "/var/www", "./www"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file = "site.pp"
  end
end