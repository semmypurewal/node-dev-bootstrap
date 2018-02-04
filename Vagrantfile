Vagrant::Config.run do |config|
  config.vm.box = "ubuntu/xenial32"

  config.vm.forward_port 3000, 3000

  config.vm.share_folder "app", "/home/vagrant/app", "app"

  # Uncomment the following line to allow for symlinks
  # in the app folder. This will not work on Windows, and will
  # not work with Vagrant providers other than VirtualBox
  # config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]

  config.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get -y upgrade"
  config.vm.provision :shell, :inline => "sudo apt-get install -y build-essential libssl-dev --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo apt-get -y install nodejs npm"
  config.vm.provision :shell, :inline => "sudo ln -sf /usr/bin/nodejs /usr/bin/node"
  config.vm.provision :shell, :inline => "sudo apt-get install -y redis-server --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo apt-get install -y mongodb --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo apt-get install -y ruby2.3-dev --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo apt-get install -y ruby2.3 --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo gem install cf"
end
