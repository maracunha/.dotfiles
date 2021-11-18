HOST_NAME=Renan

source ~/.nvm/nvm.sh
nvm use --lts
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin
export PATH="$PATH:/opt/yarn-[version]/bin"

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

vim="nvim"

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
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

fortune | cowsay -f tux

function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias vim="nvim"
alias a='code .'
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

# notify on google chat when a pull is made
alias gpn22='notify() {
  local branch=$(git symbolic-ref --short HEAD)
  local commit=$(git log -1 --pretty=%B)
  local pushResult=$(git push --porcelain)

  if [[ ${pushResult} == *"up to date"* ]]; then
    echo "GIT is up to date"
  elif [[ ${pushResult} == *"Done"* ]]; then
    CURL_OUTPUT=`curl -w -X POST -H "Content-Type: application/json" -d "{\"text\": \"Push realizado na branch $branch {🌱}\n$commit\"}" "https://chat.googleapis.com/v1/spaces/_uToagAAAAE/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=3KQJoMG1UQ4Ave8yAYzkwUJHTTLNe5NV0l8D9w6hpeQ%3D" 2> /dev/null` || CURL_RETURN_CODE=$?
    if [[ ${CURL_RETURN_CODE} -ne 0 ]]; then  
      echo "Curl returned $CURL_RETURN_CODE"
    elif [[ ${CURL_OUTPUT} != *"\"displayName\": \"Push Notifier\""* ]]; then
      echo "Curl returned: $CURL_OUTPUT"
    fi
  else
    echo "Error to push..."
  fi
};notify'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/sbin:$PATH"

##
# Your previous /Users/hi/.bash_profile file was backed up as /Users/hi/.bash_profile.macports-saved_2021-08-30_at_17:52:33
##

# MacPorts Installer addition on 2021-08-30_at_17:52:33: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

