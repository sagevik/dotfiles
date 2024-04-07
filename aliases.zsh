#Useful zsh aliases
alias reload=" source ~/.zshrc"

# select graphics card
alias gpunvidia="sudo system76-power graphics nvidia"
alias gpuintegrated="sudo system76-power graphics integrated"
alias gpuselected="sudo system76-power graphics"

# ls commands
alias lsd="ls -ld */"                                                   # List directories only

# Create bookmark
alias bm=createSymlinkBookmark                                          # Add bookmark
alias bmrm=deleteSymlinkBookmark                                        # Delete bookmark
alias bmls=listAllBookmarksWithColorCoding

alias edzshrc="vim $HOME/.zshrc"                                        # Edit .zshrc
alias edalias="vim $HOME/.dotfiles/aliases.zsh"                         # Edit aliases.zsh
alias edprofile="vim $HOME/.dotfiles/profile.zsh"                       # Edit profile.zsh
alias edfunc="vim $HOME/.dotfiles/functions.zsh"                        # Edit functions.zsh
alias edssh="vim $HOME/.ssh/config"                                     # Edit ssh config

# Quick folder access
alias cdcus="cd $HOME/.oh-my-zsh/custom"                                # Cd into oh-my-zsh custom

# Open dir in file explorer
alias e="xdg-open" $1                                                   # Open directory in file explorer

alias etemp="xdg-open $HOME/TEMP"                                       # Open TEMP folder
alias ecti="xdg-open $HOME/Pictures/ctimages"                           # Open Pictures/ctimages folder
alias edoc="xdg-open $HOME/Documents"                                   # Open Documents
alias edot="xdg-open $HOME/.dotfiles"                                   # Open ~/.dotfiles
alias edev="xdg-open $HOME/Develop"                                     # Open dev folder
alias ego="xdg-open $HOME/Develop/go"                                   # Open dev/Python folder
alias epy="xdg-open $HOME/Develop/Python"                               # Open dev/Python folder
alias ecpp="xdg-open $HOME/Develop/CPP"                                 # Open dev/CPP folder
alias epict="xdg-open $HOME/Pictures"                                   # Open Pictures folder
alias eprosj="xdg-open $HOME/Documents/Prosjekter"                      # Open Documents/Prosjekter

# Empty trash
alias emtrash="rm -rf /home/rs/.local/share/Trash/*"                  # Delete all from /home/rs/.local/share/Trash/

# Git
alias gls="git ls-files"

# xclip
alias copy='xclip -sel clip'                                            # Copy terminal output to clipboard

alias countfiles="ls | wc -l"                                           # Count files/folders in directory
alias countall=countallsubfoldersindir                                  # Count all files in current dir and subdirs

# tmux
alias tmls="tmux ls"                                                    # List tmux sessions
alias tnew="tmux new -s $1"                                             # Create new tmux session with name
alias ta="tmux new-session -A -s $1"                                    # Attach tmux session with name or create new if not exists

# Untar multiple tgz
alias untgz='for f in *.tgz; do echo Extracting "$f"; tar -xzf "$f"; done'
# Tar multiple folders
alias tgzall='for dir in */;do tar -czvf "${dir%/}".tgz "$dir"; done'

# Change wallpaper
alias wallpaper="python3 $HOME/.dotfiles/scripts/change_wallpaper.py"     # Change wallpaper

# Snap clean up
alias cleansnap="$HOME/.dotfiles/scripts/clean_snap.sh"             # Clean disabled snap's

# Pipewire control
alias pipewirecontrol="cd $HOME/.config/pipewire-controller && python3 $HOME/.config/pipewire-controller/pipewire-control.py && cd"
