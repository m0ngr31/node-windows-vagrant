# node-windows-vagrant

Node package to resolve issue where installing Node and bower packages on a folder shared between your Vagrant box and Windows has problems due to the file path character limit.

You can see more about this issue [here](https://github.com/joyent/node/issues/6960). 

## Installation ##
Use NPM to install the package:

    sudo npm -g nwv
You'll need the global flag so you can use it on all of your projects.

## Usage ##
To use, just go into your project directory and run (with no arguments):

    nwv
Running that will create symlinks for node_packages and bower_components into a folder in your home directory.

If you have set a custom directory for bower in .bowerrc, it will detect that and create the appropriate link.

If you decide to start over you can just run the command again and it will delete your symlinks and make them again.
