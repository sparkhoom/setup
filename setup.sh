#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install RVM and ruby1.9.3
curl -L https://get.rvm.io | bash
rvm install 1.9.3
sudo gem install rake

# Download the vim-config and rake
git clone https://github.com/sparkhoom/vim-config.git
# rake install will download vundle, install the bundled plugins, and link the configuration to your home 
cd vim-config
rake -y install 
# git pull and install dotfiles as well
cd $HOME
git clone https://github.com/startup-class/dotfiles.git
ln -sb setup/.screenrc .

# change the password OH-MY-ZSH
sudo passwd ubuntu 

# Install OH-MY-ZSH
sudo apt-get install -y zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh




