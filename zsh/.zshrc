if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# defaults
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="vim"
export CARGO_HOME="$HOME/.cargo"
export LUA_CPATH=";?.dylib"
export LUA_PATH="$LUA_PATH;$XDG_CONFIG_HOME/nvim/lua/yenidnya/?.lua"

# yenidnya aliases
alias vim="$XDG_CONFIG_HOME/bin/neovim/bin/nvim"
alias lg="lazygit"
alias oldvim="/usr/bin/vim"

# source amzn 
if [ -f ~/.config/amzn/zsh/profile ]; then
    source ~/.config/amzn/zsh/profile
fi

# add personal binaries to path
export PATH="$PATH:$HOME/.config/bin"
export PATH="$PATH:/opt/homebrew/opt/llvm/bin"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-nvm)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source fzf
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
else
    echo "fzf is not installed"
fi


# Source zoxide if its available
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
else
    echo "zoxide is not installed"
fi

# set readline to vi
set -o vi

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_DIR="$HOME/.nvm"
