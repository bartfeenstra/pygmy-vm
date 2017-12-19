#!/usr/bin/env bash

trap "exit" ERR

# Update APT sources.
sudo apt-get -y update

# Install Docker.
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
# Add the VM's user to the "docker" group to prevent having to sudo.
sudo usermod -a -G docker $PYGMY_VM_USER

# Install rbenv.
RBENV_PATH="/opt/rbenv"
if [ -d ~/.rbenv ]
then
    cd ~/.rbenv
    git pull
else
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
fi

# Install ruby-build.
if [ -d ~/.rbenv/plugins/ruby-build ]
then
    cd ~/.rbenv/plugins/ruby-build
    git pull
else
    mkdir -p ~/.rbenv/plugins
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Install Ruby.
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
rbenv install 2.4.2 --skip-existing
rbenv global 2.4.2

# Install Pygmy.
gem install pygmy
pygmy up
