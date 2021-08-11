plugins_dir=~/dotfiles/plugins

mkdir $plugins_dir
cd $plugins_dir

git clone https://github.com/djui/alias-tips.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zdharma/history-search-multi-word.git

cd ..
mv $plugins_dir/* ~/.oh-my-zsh/custom/plugins

rm -rf $plugins_dir
