This is a Vagrant file and set of Chef recipes for building a basic node development environment.
If you're not familiar with Vagrant, read more about it at vagrantup.com.

To set up, make sure you have ruby gems and VirtualBox (> 4.0) installed. Next:

    gem install vagrant
    vagrant box add base http://files.vagrantup.com/lucid32.box

If you already have Vagrant, make sure it's a later version (> 0.9.0).

Clone this repository and type

    vagrant up

After a few minutes, you should have a virtual dev environment with node, npm, mongodb and redis.
The app folder is shared, and port 3000 on the VM is forwarded to port 3000 on the localhost. This
is all customizable in the Vagrantfile.

You can test out your environment by ssh'ing into your environment and running the sample script:

    vagrant ssh
    cd app
    node server.js

Next open localhost:3000 in your web browser. If everything worked correctly, you should see
'Hello World'


