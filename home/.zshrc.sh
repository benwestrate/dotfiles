#!/usr/bin/env zsh


# Path to your oh-my-zsh installation.
export ZSH="/Users/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh


curr="$HOME/Developer/benwestrate/dotfiles"

# Load main files.
source "$curr/terminal/startup.sh"
source "$curr/terminal/completion.sh"
source "$curr/terminal/highlight.sh"

autoload -U colors && colors

# Load and execute the prompt theming system.
#fpath=("$curr/terminal" $fpath)
#autoload -Uz promptinit && promptinit
#prompt 'paulmillr'

# ==================================================================
# = Aliases =
# ==================================================================

alias -g f10='| head -n 10'
alias -g l10='| tail -n 10'
# Simple clear command.
alias cl='clear'

# Disable sertificate check for wget.
alias wget='wget --no-check-certificate'

# JSHint short-cut.
alias lint=jshint

# Some OS X-only stuff.
if [[ "$OSTYPE" == darwin* ]]; then
    # Short-cuts for copy-paste.
    alias c='pbcopy'
    alias p='pbpaste'
    
    # Remove all items safely, to Trash (`brew install trash`).
    alias rm='trash'
    
    # Case-insensitive pgrep that outputs full path.
    alias pgrep='pgrep -fli'
    
    # Lock current session and proceed to the login screen.
    alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
    
    # Sniff network info.
    alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
    
    # Process grep should output full paths to binaries.
    alias pgrep='pgrep -fli'
else
    # Process grep should output full paths to binaries.
    alias pgrep='pgrep -fl'
fi


# Package managers.

alias ni='npm install'
alias nis='npm install --save'

alias serve='python -m SimpleHTTPServer'


# Nginx short-cuts.
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias ngre='sudo nginx -s stop && sudo nginx'
alias nglog='tail -f /usr/local/var/log/nginx/access.log'
alias ngerr='tail -f /usr/local/var/log/nginx/error.log'

# Checks whether connection is up.
alias net="ping ya.ru | grep -E --only-match --color=never '[0-9\.]+ ms'"

# Pretty print json
alias json='python -m json.tool'


# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Finder shorcuts
alias show-hidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hide-hidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


# Import custom alias's and fuctions
. $curr/home/custom.sh

# Import Private system specific functions
# note this will be empty on install
. $HOME/.ben/.privaterc

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
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export GOPATH="$HOME/go"; export GOROOT="/usr/local/go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# GPG set up
export GPG_TTY=$(tty)