#!/bin/bash
set -e

# Ubuntu release upon which the current distro is based
UBUNTU_RELEASE='groovy'

DOTFILES=$HOME/dotfiles/dotfiles

# Copy files
# cp ./images/* $HOME/Pictures/

# TODO: use script to install latest versions
# Download debs
wget -P $HOME/Downloads https://mega.nz/linux/MEGAsync/xUbuntu_20.10/amd64/megacmd_1.4.0-2.1_amd64.deb
wget -P $HOME/Downloads https://mega.nz/linux/MEGAsync/xUbuntu_20.10/amd64/dolphin-megasync_4.1.1+4.1_amd64.deb
wget -P $HOME/Downloads https://mega.nz/linux/MEGAsync/xUbuntu_20.10/amd64/megasync_4.3.5-7.1_amd64.deb

wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -P $HOME/Downloads https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
wget -P $HOME/Downloads https://downloads.mongodb.com/compass/mongodb-compass_1.19.3_amd64.deb

# wget -P $HOME/Downloads https://github.com/cli/cli/releases/download/v1.0.0/gh_1.0.0_linux_arm64.deb

wget -P $HOME/Downloads https://github.com/sharkdp/bat/releases/download/v0.9.0/bat-musl_0.9.0_amd64.deb
wget -P $HOME/Downloads https://github.com/kaikramer/keystore-explorer/releases/download/v5.4.3/kse-5.4.3.deb
wget -P $HOME/Downloads https://github.com/barnumbirr/delta-debian/releases/download/0.4.1-1/delta-diff_0.4.1-1_amd64_debian_buster.deb

# Autokey
wget -P $HOME/Downloads https://github.com/autokey/autokey/releases/download/v0.95.10/autokey-common_0.95.10-0_all.deb
wget -P $HOME/Downloads https://github.com/autokey/autokey/releases/download/v0.95.10/autokey-gtk_0.95.10-0_all.deb

# wget -P $HOME/Downloads ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb

# Install debs
sudo apt install -y $HOME/Downloads/*.deb

# f.lux
# doesn't support focal yet
# sudo add-apt-repository ppa:nathan-renniewaldock/flux

# Add software sources
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# not required any more in linux mint 20
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Sublime
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# uget
# TODO: Add -y option ? so that doesn't ask for enter
# not required any more in linux mint 20
# sudo apt-add-repository -y ppa:plushuang-tw/uget-stable

# parcelite
# not required any more in linux mint 20
# sudo add-apt-repository -y ppa:rickyrockrat/parcellite-appindicator

# xdm
# install manually https://subhra74.github.io/xdm/
# sudo add-apt-repository ppa:noobslab/apps
# sudo apt-get update && sudo apt-get xdman install

# typora

# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'

# ulauncher
sudo add-apt-repository ppa:agornostal/ulauncher

# albert
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:manuelschneid3r.gpg > /dev/null
# sudo apt update
# sudo apt install albert

# shutter
sudo add-apt-repository -y ppa:linuxuprising/shutter

sudo apt update

# calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin


# \ # mysql-workbench \ # ipython \ # ipython3 \ python-pip \ mongodb \ fluxgui


sudo apt install -y \
    apt-transport-https \
    ack \
    build-essential \
    pandoc \
    shunit2 \
    cpulimit \
    curl \
    cheese \
    direnv \
    debhelper \
    fd-find \
    fonts-firacode \
    flameshot \
    gparted \
    htop \
    lastpass-cli \
    ncdu \
    meld \
    mysql-client mysql-server mycli \
    megacmd \
    numix-icon-theme-circle \
    neovim
    parcellite \
    postgresql pgcli \
    python-dev \
    python3-dev \
    python3-pip \
    python3-venv \
    ipython3 \
    bpython \
    ripgrep \
    ranger \
    ruby-full \
    redis-server \
    sublime-text \
    sublime-merge \
    shutter \
    stress \
    terminator \
    tree \
    tldr \
    typora \
    ulauncher \
    uget aria2 \
    vagrant \
    vim vim-gtk3 \
    virtualbox \
    virtualbox-qt \
    virtualenv virtualenvwrapper\
    xclip

if [[ $(echo $XDG_CURRENT_DESKTOP) == *"GNOME"* ]]; then
  sudo apt-get install gnome-tweak-tool
fi

# for linux mint 20. Have to delete this file to be able to install snap.
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt-get update
sudo apt-get install snapd -y

sudo snap install vscode --classic
sudo snap install postman
sudo snap install insomnia
sudo snap install vlc
sudo snap install skype --classic
sudo snap install gitkraken --classic
sudo snap install slack --classic


# Install nvm
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Install node js
nvm install node

# Install global npm packages
npm i -g \
    fx \
    serve \
    gitmoji-cli \
    semantic-git-commit-cli

# Install pyenv
curl https://pyenv.run | bash

# Install python 3
pyenv install 3.5.3
pyenv install 3.8.3

# install grunt
# npm install -g grunt-cli

# Install create-react-app for react js
# now npx is used to run create-react-app
# npm install -g create-react-app

#  Install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
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

# add the repository in the Linux mint 20
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


sudo groupadd docker
sudo usermod -aG docker $USER

# Install docker-compose
sudo apt-get -y install docker-compose


# Install docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# install lazy docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install libinput-gestures and gestures
sudo gpasswd -a $USER input
su - ${USER}
sudo apt install libinput-tools -y

git clone https://github.com/bulletmark/libinput-gestures.git /tmp/libinput-gestures
cd /tmp/libinput-gestures
sudo make install

libinput-gestures-setup autostart
libinput-gestures-setup start

sudo apt install python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject
git clone https://gitlab.com/cunidev/gestures /tmp/gestures
cd /tmp/gestures
sudo python3 setup.py install

cd $DOTFILES

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

# youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Install Jumpapp
cd /tmp/
git clone https://github.com/mkropat/jumpapp.git
cd jumpapp
make deb
sudo dpkg -i jumpapp*all.deb
make clean
cd ..

# install vnote
# wget -P $HOME/Downloads  https://github.com/tamlok/vnote/releases/download/v2.2/VNote-2.2-x86_64.AppImage
# sudo mkdir /opt/vnote
# sudo mv $HOME/Downloads/VNote-2.2-x86_64.AppImage /opt/vnote/
# sudo ln -sf /opt/vnote/VNote-2.2-x86_64.AppImage /usr/bin/vnote

# install rustp, cargo and rust
# TODO: enter 1 for continue installation at the prompt
curl https://sh.rustup.rs -sSf | sh

# Install Cargo packages
cargo install exa
cargo install gitui

# install rbenv for ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
# doctor for rbenv verification
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# Enable scroll coasting (momentum)
sudo apt-get install xserver-xorg-input-synaptics

cd $DOTFILES

# Clear downloaded debs
rm $HOME/Downloads/*.deb

sudo apt upgrade -y

# Fix broken packages just in case
sudo apt-get install -f

# Clean all generated files
git clean -f

# Import gnome desktop settings

if [[ $(echo $XDG_CURRENT_DESKTOP) == *"GNOME"* ]]; then
    dconf load /org/gnome/ < ./gnome.conf
else
    dconf load /org/cinnamon/ < ./cinnamon.conf
fi


# Finally install zsh
sudo apt-get -y install zsh

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install ZSH plugins
./install_zsh_plugins.sh
