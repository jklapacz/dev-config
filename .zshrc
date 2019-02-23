if [ -d "$HOME/homebrew/bin" ]; then
    PATH="$HOME/homebrew/bin:$PATH"
fi
#Initialize for powerline shell in ubuntu:
#

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# end
#if [ -d "$HOME/homebrew/bin" ]; then
#    PATH="$HOME/homebrew/bin:$PATH"
#fi
##########################################################
# Pre configuration
#
#
# These two load hub completions
fpath=(~/.zsh/completions $fpath) 
autoload -Uz compinit && compinit

# Initialize autojump


# Define the environment variable ZPLUG_HOME 
export ZPLUG_HOME=~/.zplug
export ZPLUG_HOME=~/homebrew/opt/zplug

# Loads zplug
source $ZPLUG_HOME/init.zsh

# Clear packages
zplug clear

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=50000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=50000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

###########################################################
# Packages

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "paulmelnikow/zsh-startup-timer"
zplug "tysonwolker/iterm-tab-colors"
zplug "desyncr/auto-ls"
zplug "momo-lab/zsh-abbrev-alias"
zplug "rawkode/zsh-docker-run"
zplug "peterhurford/up.zsh"
zplug "jimeh/zsh-peco-history"
#zplug "gusaiani/elixir-oh-my-zsh"
#zplug "plugins/git",  from:oh-my-zsh, as:plugin
zplug "psprint/zsh-cmd-architect"
zplug "robbyrussell/oh-my-zsh"
zplug "rutchkiwi/copyzshell", from:oh-my-zsh, as:plugin
zplug "webyneter/docker-aliases", use:docker-aliases.plugin.zsh
  
###########################################################
# Theme

zplug "b-ryan/powerline-shell"

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in ${precmd_functions[@]}; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

###########################################################
# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

###########################################################
# Post configuration

# Aliases
abbrev-alias -g G="| grep"
abbrev-alias -g v5="-maint-5.0"

# Docker images
#function npm() {
#  run_with_docker "node" "alpine" "npm" $@
#}

function go() {
  run_with_docker "golang" "latest" "go" $@
}

function php() {
  run_with_docker "php" "latest" "php" $@
}

eval "$(hub alias -s)"

source ~/.aliases

###########################################################
# NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Open ssl, this might not be necessary...
export HUB=docker-jklapacz-misc-dev.artifactory00.cc.pdrop.net
source ~/projects/random/bin/utils

export PATH=$PATH:$HOME/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export DOCKER_REPO=docker-jklapacz-misc-dev.artifactory00.cc.pdrop.net

export PATH=$HOME/bin:$PATH

