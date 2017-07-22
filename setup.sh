# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh brew.sh

# set installed zsh
echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh

#install nodebrew, rbenv, pyenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/yyuu/pyenv.git ~/.pyenv


# symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.functions ~/.functions
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/oh-my-zsh/original.zsh-theme ~/oh-my-zsh/themes/original.zsh-theme

# compile zshrc
zcompile ~/.zshrc
