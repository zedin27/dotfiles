#iTerm being slow again? NO PROBLEM
find ~/Library/Logs/DiagnosticReports -mindepth 1 -delete &>/dev/null #2>&1 &

#H A C I
defaults write -g InitialKeyRepeat -int 10 2> /dev/null #Don't set this int to 0
defaults write -g KeyRepeat -int 2 2> /dev/null #Don't set this int to 0

#Drink water reminder script
sh Water-Reminder/drinkwater.sh

#Norm
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"

#aliasing because is fun
alias venv="virtualenv -p /usr/local/bin/python3 .venv"
alias vs="open -a Visual\ Studio\ Code.app"
alias root="cd"
alias gcc="gcc -Wextra -Wall -Werror"
alias project="cd Desktop/42_Projects/"

#Homebrew stuff
mkdir -p /tmp/.$(whoami)-brew-locks
export PATH="$HOME/.brew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#Go stuff
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

#Python stuff
# export PATH=/usr/local/share/python:$PATH

#export PATH=/Users/ztisnes/.npm-global/lib/node_modules/typescript/bin
while true; do bash drinkwater.sh && sleep 900; done

#UNUSED
# alias submodule="git submodule add https://github.com/zedin27/42_libft libft"
# alias update="git submodule update --rebase --remote"
