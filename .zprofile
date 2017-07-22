# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

# nodbrew
export NODBREW_ROOT="$HOME/.nodebrew"
export PATH="$NODBREW_ROOT/current/bin:$PATH"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# gopath
export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin
