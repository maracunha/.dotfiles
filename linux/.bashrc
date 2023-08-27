set -o vi
HOST_NAME=Renan
export XDG_CONFIG_HOME=$HOME/.config

shopt -s autocd
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PERSONAL=$XDG_CONFIG_HOME

source $PERSONAL/env
#for i in `find -L $PERSONAL`; do
#    source $i
#done

addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/scripts

HISTCONTROL=ignoredups
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

# To open fzf on my directory
bind -x '"\C-f": tmux-sessionizer'

# Up arrow
bind '"\e[A": history-search-backward'

# Down Arrow
bind '"\e[B": history-search-forward'


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "🏈" "🍺" "🐷" "🌵")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

# -------
# Aliases
# -------
alias vim="nvim"
alias c='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias nr='npm run'
alias nis='npm i -S'
alias l="ls -1" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias npm-flush='rm -rf ./node_modules && rm package-lock.json && npm i' # Clean npm modules and install again
alias npm-global='npm list -g --depth 0' # Show all packages installed globally
alias cats="cat package.json | grep script" # Show all scripts on package.json
alias lb="ls -1d b-*" # List all directory start with b | that is for worktree branch

# ----------------------
# Git Aliases
# ----------------------
alias ct='git describe --tags `git rev-list --tags --max-count=1`'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias chrome="open -a 'Google Chrome'"
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'


# Default itens from bash

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
