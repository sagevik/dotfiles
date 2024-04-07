# Display settings
# https://itslinuxfoss.com/set-custom-resolution-using-xrandr/
#xrandr --newmode "5120x1440_59.98"  623.45  5120 5488 6048 6976  1440 1441 1444 1490  -HSync +Vsync
#xrandr --addmode DP-2 "5120x1440_59.98"

unset LESS

# Load dotfiles
DOTFILES="$HOME/.dotfiles"

source $DOTFILES/aliases.zsh
source $DOTFILES/functions.zsh
source $DOTFILES/poetry.zsh

# Change command prompt
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$green\u:$yellow\$(__git_ps1)$red \w $ $reset"
#export PS1="$green\u:$yellow\$(__git_ps1)$red \W $ $reset"

# Golang
export GOPRIVATE=bitbucket.org/*
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Develop/go
export PATH=$PATH:$GOPATH:$HOME/Develop/go/bin

# Paths
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH=$PATH:/home/rs/.local/bin

# Bookmarks
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=":$HOME/.bookmarks:/"
    alias gt="cd -P"
fi

#if [ -f ~/.config/exercism/exercism_completion.bash ]; then
#    source ~/.config/exercism/exercism_completion.bash
#fi

