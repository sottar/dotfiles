# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh brew.sh

# set git-lfs
git lfs install

# set installed zsh
echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install nodenv, rbenv, pyenv
# git clone https://github.com/nodenv/nodenv.git ~/.nodenv
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# vim
mkdir ~/.vim & cd ~/.vim
mkdir colors
git clone git@github.com:jpo/vim-railscasts-theme.git
cp vim-railscasts-theme/colors/railscasts.vim ~/.vim/colors/railscasts.vim
rm -rf vim-railscasts-theme/

# symlinks
ln -sf ~/dotfiles/.zshrc ~/.config/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.config/.zprofile
ln -sf ~/dotfiles/.aliases ~/.config/.aliases
ln -sf ~/dotfiles/.functions ~/.config/.functions
ln -sf ~/dotfiles/.vimrc ~/.config/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.config/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.config/.gitignore
ln -sf ~/dotfiles/.tigrc ~/.config/.tigrc
ln -sf ~/dotfiles/sheldon ~/.config/sheldon
ln -sf ~/dotfiles/configs/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/warp ~/.warp
# ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -sf ~/dotfiles/vscode/.eslintignore ~/Library/Application\ Support/Code/User/.eslintignore
# ln -sf ~/dotfiles/vscode/snippets/* ~/Library/Application\ Support/Code/User/snippets/
ln -sf ~/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf ~/dotfiles/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
# ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json

source ~/.zshrc

# compile zshrc
zcompile ~/.zshrc
