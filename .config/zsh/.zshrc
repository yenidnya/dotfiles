# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh
    
# yenidnya aliases
alias vim="nvim"
alias lg="lazygit"
alias oldvim="/usr/bin/vim"

# defaults
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export CARGO_HOME="$HOME/.cargo"
export LUA_CPATH=";?.dylib"
export LUA_PATH="$LUA_PATH;$XDG_CONFIG_HOME/nvim/lua/yenidnya/?.lua"

# add personal binaries to path
export PATH="$PATH:$HOME/.config/bin"
export PATH="$PATH:/opt/homebrew/opt/llvm/bin"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


# source amzn 
if [ -f ~/.config/amzn/zsh/rc ]; then
    source ~/.config/amzn/zsh/rc
fi

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
