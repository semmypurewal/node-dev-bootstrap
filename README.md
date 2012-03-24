This is a Vagrant file and set of Chef recipes for building a basic node development environment.
If you're not familiar with Vagrant, read more about it at vagrantup.com.

To get this to work, you must have VirtualBox (> 4.1.0) and Vagrant (> 1.0) installed. Installers
for VirtualBox are available at virtualbox.org, and installers for Vagrant are available at 
vagrantup.com.

Once you have the pre-requisites installed, simply open a terminal and add the base box:

    vagrant box add base http://files.vagrantup.com/lucid32.box

Next, clone this repository 

    git clone https://github.com/semmypurewal/node-dev-bootstrap.git my_project

Finally, change to your new project directory and start your VM:

    cd my_project
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


