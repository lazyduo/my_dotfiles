HOST_NAME=lazyduo

## source ~/.nvm/nvm.sh
# nvm use stable
# shopt -s autocd
# shopt -s histappend

export PATH=/opt/homebrew/bin:$PATH

export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldblue='\e[1;34m' # Bold Blue
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldblue%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1=">"

fortune | cowsay

# Aliases
alias rs="cd /Users/dada/project/yumi && python3 manage.py runserver 0.0.0.0:8000"
alias rnd="open 'rndebugger://set-debugger-loc?host=localhost&port=8081'"
alias myip="curl ipinfo.io/ip"

