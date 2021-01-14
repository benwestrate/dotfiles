#!/usr/bin/env zsh


eval "$(starship init zsh)"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

curr="$HOME/Developer/benwestrate/dotfiles"

# Load main files.
source "$curr/terminal/startup.sh"
source "$curr/terminal/completion.sh"
source "$curr/terminal/highlight.sh"

autoload -U colors && colors

export EDITOR='vim'

# Package managers.

alias ni='npm install'
alias nis='npm install --save'

alias serve='python -m SimpleHTTPServer'


# Finder shorcuts
alias show-hidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hide-hidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"


# Import custom alias's and fuctions
. $curr/home/custom.sh

# NVM setup
. ~/.nvm/nvm.sh

export PATH="$HOME/.yarn/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GVM Setup
# source $HOME/.gvm/scripts/gvm

# gnutils
export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"
[[ -s "/Users/ben/.gvm/scripts/gvm" ]] && source "/Users/ben/.gvm/scripts/gvm"

# Go Path Setup
# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# GPG set up
export GPG_TTY=$(tty)

