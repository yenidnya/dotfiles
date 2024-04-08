#!/bin/bash

set -euo pipefail

if command -v brew &>/dev/null; then
    echo "Homebrew is already installed."
else
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v zsh &>/dev/null; then
    echo "zsh is already installed."
else
    echo "zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if command -v cargo &>/dev/null; then
    echo "cargo is installed"
else
    echo "Installing cargo with rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if command -v nvim &>/dev/null; then
    echo "neovim is installed"
else
    echo "Installing neovim..."
    brew install neovim
fi

if command -v alacritty &>/dev/null; then
    echo "alacritty is installed"
else
    echo "Installing alacritty..."
    cargo install alacritty
fi

if command -v tmux &>/dev/null; then
    echo "tmux is installed"
else
    echo "Installing tmux..."
    brew install tmux
fi

#TODO: brew install fzf
#TODO: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k \n echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#TODO: LLDB 

# TODO: cargo insalls
# https://github.com/tamasfe/taplo
