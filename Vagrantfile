Vagrant::Config.run do |config|
  config.vm.box = "base"

  config.vm.forward_port 3000, 3000

  config.vm.share_folder "app", "/home/vagrant/app", "app"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "nodejs"
    # Uncomment the line below if you're using a version of node
    # that doesn't include NPM, (version less than 0.6.3)
    # chef.add_recipe "nodejs::npm"
    chef.add_recipe "mongodb-debs"
    chef.add_recipe "redis-server"
    chef.json = {
      "nodejs" => {
        "version" => "0.6.12"
      }    	      
    }
  end
end
