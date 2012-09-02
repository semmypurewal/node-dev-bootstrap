This is a Vagrant file and set of Chef recipes for building a basic node development environment.
If you're not familiar with Vagrant, read more about it at http://www.vagrantup.com.

To get this to work, you must have VirtualBox (> 4.1.0) and Vagrant (> 1.0) installed. Installers
for VirtualBox are available at http://www.virtualbox.org, and installers for Vagrant are available
at http://www.vagrantup.com.

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

## Note to Windows Users

Later versions of VirtualBox do not support symlinks in shared folders on Windows hosts.
This can cause problems when you're attempting to install certain packages via npm. For
example, the 'jade' package creates symlinks during installation, and therefore the
installation fails.

More information is available here: https://www.virtualbox.org/ticket/10085

One workaround is to install an older build of VirtualBox. Anything prior to
4.1.8 appears to work. Version 4.1.6 can be found here: 
https://www.virtualbox.org/wiki/Download_Old_Builds_4_1




