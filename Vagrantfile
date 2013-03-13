Vagrant::Config.run do |config|
  config.vm.box = "base"

  config.vm.forward_port 3000, 3000

  config.vm.share_folder "app", "/home/vagrant/app", "app"

  # allow for symlinks in the app folder
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "nodejs"
    chef.add_recipe "mongodb-debs"
    chef.add_recipe "redis-server"
    chef.json = {
      "nodejs" => {
        "version" => "0.8.18"
        # uncomment the following line to force
        # recent versions (> 0.8.5) to be built from
        # the source code
        # , "from_source" => true
      }
    }
  end

  #install node module dependencies
  config.vm.provision :shell do |shell|
    shell.inline = <<-END_SCRIPT 
                   if [[ -e 'app/package.json' ]]; 
                    then echo 'Installing node modules'; 
                    cd app; npm install -q, --quiet: --loglevel error; 
                   else echo 'No package.json file found: Skipping npm installation'; fi
                   END_SCRIPT
  end
end
