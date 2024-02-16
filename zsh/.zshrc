if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# yenidnya aliases
alias vim="/opt/homebrew/bin/nvim"
alias lg="lazygit"
alias pvim="/usr/bin/vim"

# defaults
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="/opt/homebrew/bin/nvim"

# functions
fpath=(
    ~/.config/zsh/zfuncs
    "${fpath[@]}"
)

# source profiles
if [ -f ~/.config/zsh/profiles/amazon ]; then
    source ~/.config/zsh/profiles/amazon
fi

# add personal binaries to path
export PATH="$PATH:$HOME/.config/bin"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-nvm)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source fzf
if [[ -f "${XDG_CONFIG_HOME}/.fzf.zsh" ]]; then 
    source "${XDG_CONFIG_HOME}/.fzf.zsh"
fi

eval "$(zoxide init --cmd cd zsh)"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_DIR="$HOME/.nvm"
