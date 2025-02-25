# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

# include external files
for file in ~/.{functions,aliases}; do
  [ -r "$file" ] && source "$file"
done

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/sotaohara/.zsh/completions:"* ]]; then export FPATH="/Users/sotaohara/.zsh/completions:$FPATH"; fi


[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

ISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt auto_pushd
setopt auto_cd
autoload -Uz compinit
compinit


## fzf
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# ======== Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sotaohara/Downloads/google-cloud-sdk/y/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sotaohara/Downloads/google-cloud-sdk/y/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sotaohara/Downloads/google-cloud-sdk/y/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sotaohara/Downloads/google-cloud-sdk/y/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.nodenv/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sottar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sottar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sottar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sottar/google-cloud-sdk/completion.zsh.inc'; fi

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

. "/Users/sotaohara/.local/share/deno/env"

## eval
eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
eval "$(ssh-agent)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/sotaohara/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$(brew --prefix python)/libexec/bin:$PATH"
