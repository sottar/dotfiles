# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="original"
plugins=(git)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

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

# include external files
for file in ~/.{functions,aliases}; do
  [ -r "$file" ] && source "$file"
done

# z
. /usr/local/etc/profile.d/z.sh


function peco-z-search() {
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search
bindkey '^f' peco-z-search

# peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  BUFFER=$(\history -n 1 | \
    eval $tac | \
    awk '!a[$0]++' | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
