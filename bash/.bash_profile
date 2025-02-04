HOST_NAME=Renan

set -o vi
export XDG_CONFIG_HOME=$HOME/.config

source ~/.nvm/nvm.sh

# To be available all files inside personal
PERSONAL=$XDG_CONFIG_HOME/personal/*
for i in `find -L $PERSONAL`; do
  source $i
done

shopt -s autocd
shopt -s histappend

export HISTSIZE=5000
export HISTFILESIZE=10000

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
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

if [ -f .nvmrc ]; then
  nvm use
else
  nvm use node
fi
. "$HOME/.cargo/env"

# Padman | Docker

# export DOCKER_HOST=unix://Users/dbservices-renan/.local/share/containers/podman/machine/qemu/podman.sock


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dbservices-renan/work/cloud/google-cloud-sdk/path.bash.inc' ]; then . '/Users/dbservices-renan/work/cloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dbservices-renan/work/cloud/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/dbservices-renan/work/cloud/google-cloud-sdk/completion.bash.inc'; fi

# For compilers to find ruby you may need to set
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
