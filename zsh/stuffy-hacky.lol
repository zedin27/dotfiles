#iTerm being slow again? NO PROBLEM
find ~/Library/Logs/DiagnosticReports -mindepth 1 -delete &>/dev/null #2>&1 &

#H A C I
defaults write -g InitialKeyRepeat -int 1 2> /dev/null #Don't set this int to 0
defaults write -g KeyRepeat -int 1 2> /dev/null #Don't set this int to 0

#Drink water reminder script
sh Water-Reminder/drinkwater.sh

#Norm
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"

#aliasing because is fun
alias root="cd"
alias gcc="gcc -Wextra -Wall -Werror"
alias project="cd Desktop/42_Projects/"
alias submodule="git submodule add https://github.com/zedin27/42_libft libft"
alias update="git submodule update --rebase --remote"

#Homebrew stuff
mkdir -p /tmp/.$(whoami)-brew-locks
export PATH="$HOME/.brew/bin:$PATH"

#Go stuff
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
alias atom="open -a Atom.app"

# Change the wallaper
# defaults write com.apple.desktop Background '{default = {ImageFilePath = "/nfs/2017/z/ztisnes/Desktop/Misc/Wallpapers/gargantua.jpg"; };}'
