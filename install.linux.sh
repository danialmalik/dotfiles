#!/bin/bash

# Ubuntu release upon which the current distro is based
UBUNTU_RELEASE='bionic'

# Copy files
cp ./images/* $HOME/Pictures/

# Download debs
wget -P $HOME/Downloads https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb
wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -P $HOME/Downloads https://github.com/sharkdp/bat/releases/download/v0.9.0/bat-musl_0.9.0_amd64.deb
wget -P $HOME/Downloads https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
wget -P $HOME/Downloads https://downloads.mongodb.com/compass/mongodb-compass_1.19.3_amd64.deb
wget -P $HOME/Downloads https://zoom.us/client/latest/zoom_amd64.deb
# wget -P $HOME/Downloads ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb

# Install debs
sudo apt install -y $HOME/Downloads/*.deb

# Add software sources
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Sublime merge
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# uget
# TODO: Add -y option ? so that doesn't ask for enter
sudo apt-add-repository ppa:plushuang-tw/uget-stable

# parcelite
sudo add-apt-repository ppa:rickyrockrat/parcellite-appindicator

# xdm
# install manually https://subhra74.github.io/xdm/
# sudo add-apt-repository ppa:noobslab/apps
# sudo apt-get update && sudo apt-get xdman install



sudo apt update

# calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

sudo apt install -y \
    apt-transport-https \
    build-essential \
    pandoc \
    shunit2 \
    curl \
    debhelper \
    htop \
    ncdu \
    mysql-client mysql-server mysql-workbench \
    megacmd \
    ipython \
    ipython3 \
    parcellite \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip \
    ranger \
    ruby-full \
    redis-server \
    snapd \
    sublime-text \
    sublime-merge \
    terminator \
    tree \
    uget aria2 \
    vagrant \
    vlc \
    vim vim-gtk3 \
    virtualbox \
    virtualbox-qt \
    virtualenv virtualenvwrapper\
    xclip

sudo snap install postman
sudo snap install vscode --classic
sudo snap install insomnia
sudo snap install skype --classic
sudo snap install gitkraken

# Install nvm
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
curl -o- https://raw.githubusercontent.com/creationix/nvm/$(get_latest_release "creationix/nvm")/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Install node js

nvm install node

# install grunt
npm install -g grunt-cli

# Install create-react-app for react js
# now npx is used to run create-react-app
# npm install -g create-react-app

#  Install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# already added above
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# $(lsb_release -cs) returns 'tessa','tina' or 'tricia' for mint releases
# instead we need "bionic"
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


sudo groupadd docker
sudo usermod -aG docker $USER

# Install docker-compose
sudo apt-get -y install docker-compose


# # install wocker
# mkdir ~/progs
# cd ~/progs
# vagrant plugin install vagrant-hostsupdater
# git clone https://github.com/wckr/wocker.git && cd wocker
# vagrant up
# vagrant halt

# # install watchman
# cd ~/Downloads
# git clone https://github.com/facebook/watchman.git
# cd watchman
# git checkout v4.9.0  # the latest stable release
# ./autogen.sh
# ./configure
# make
# sudo make install
# cd ..


# Install Jumpapp
cd ~/Downloads
git clone https://github.com/mkropat/jumpapp.git
cd jumpapp
make deb
sudo dpkg -i jumpapp*all.deb
make clean
cd ..

sudo apt-get -y install -f	# if there were missing dependencies

# install vnote
# wget -P $HOME/Downloads  https://github.com/tamlok/vnote/releases/download/v2.2/VNote-2.2-x86_64.AppImage
# sudo mkdir /opt/vnote
# sudo mv $HOME/Downloads/VNote-2.2-x86_64.AppImage /opt/vnote/
# sudo ln -sf /opt/vnote/VNote-2.2-x86_64.AppImage /usr/bin/vnote

# install rustp, cargo and rust
# TODO: enter 1 for continue installation at the prompt
curl https://sh.rustup.rs -sSf | sh


# install rbenv for ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
# doctor for rbenv verification
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash


cd $HOME/dotfiles/

# Clear downloaded debs
rm $HOME/Downloads/*.deb

sudo apt upgrade

# Fix broken packages just in case
sudo apt-get install -f

# Clean all generated files
git clean -f

# Import gnome desktop settings
# dconf load /org/gnome/ < ./gnome.conf
dconf load /org/cinnamon/ < ./cinnamon.conf

# Finally install zsh
sudo apt-get -y install zsh

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install ZSH plugins
./install_zsh_plugins.sh

echo "YOU ARE DONE :)"
