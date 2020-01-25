# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh brew.sh

# set installed zsh
echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install nodenv, rbenv, pyenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# vim
mkdir ~/.vim & cd ~/.vim
mkdir colors
git clone git@github.com:jpo/vim-railscasts-theme.git
mkdir  ~/.vim/
mkdir ~/.vim/colors/
cp vim-railscasts-theme/colors/railscasts.vim ~/.vim/colors/railscasts.vim
rm -rf vim-railscasts-theme/

# symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.functions ~/.functions
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.tigrc ~/.tigrc
# ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -sf ~/dotfiles/vscode/.eslintignore ~/Library/Application\ Support/Code/User/.eslintignore
# ln -sf ~/dotfiles/vscode/snippets/* ~/Library/Application\ Support/Code/User/snippets/
# ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf ~/dotfiles/oh-my-zsh/original.zsh-theme ~/.oh-my-zsh/themes/original.zsh-theme

source ~/.zshrc

# compile zshrc
zcompile ~/.zshrc
