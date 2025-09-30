# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# source amzn 
if [ -f ~/.config/amzn/zsh/profile ]; then
    source ~/.config/amzn/zsh/profile
fi
