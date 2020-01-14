plugins_dir=~/dotfiles/plugins

mkdir $plugins_dir
cd $plugins_dir


git clone https://github.com/djui/alias-tips.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

cd ..
mv $plugins_dir/* ~/.oh-my-zsh/plugins


rm $plugins_dir -rf
