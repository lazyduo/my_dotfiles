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

# simple cowsay
# fortune | cowsay

# Aliases
alias rs="cd /Users/dada/project/yumi && python3 manage.py runserver 0.0.0.0:8000"
alias rnd="open 'rndebugger://set-debugger-loc?host=localhost&port=8081'"
alias myip="curl ipinfo.io/ip"

# lolcat
currenttime=$(date +%H:%M)
#figlet "Current Time: ${currenttime}" | lolcat
if [[ "$currenttime" > "08:00" && "$currenttime" < "12:00" ]];
then
figlet "GOOD MORNING ${USER^^}" | lolcat
elif [[ "$currenttime" > "12:00" && "$currenttime" < "18:00" ]];
then
figlet "GOOD AFTERNOON ${USER^^}" | lolcat
elif [[ "$currenttime" > "18:00" && "$currenttime" < "00:00" ]];
then
figlet "GOOD EVENING ${USER^^}" | lolcat
else
figlet "GO TO BED ${USER^^}" | lolcat
fi
#figlet "WELCOME" | lolcat
COWS=('apt'
'cheese'
'default'
'elephant-in-snake'
'fox'
'kangaroo'
'luke-koala'
'moose'
'sheep'
'stimpy'
'turtle'
'vader-koala'
'bud-frogs'
'cock'
'dragon-and-cow'
'elephant'
'ghostbusters'
'kiss'
'mech-and-cow'
'pony-smaller'
'skeleton'
'suse'
'tux'
'vader'
'bunny'
'cower'
'dragon'
'eyes'
'gnu'
'koala'
'milk'
'pony'
'snowman'
'three-eyes'
'unipony-smaller'
'www'
'calvin'
'daemon'
'duck'
'flaming-sheep'
'hellokitty'
'kosh'
'moofasa'
'ren'
'stegosaurus'
'turkey'
'unipony')
#echo ${COWS[$(($RANDOM%10))]}
fortune | cowsay -f ${COWS[$(($RANDOM%47))]} | lolcat
