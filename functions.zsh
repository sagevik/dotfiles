#/usr/bin/zsh

# Bookmarks
# Create bookmark
createSymlinkBookmark(){
    currentDirectoryPath=$PWD
    currentDirectoryName=${PWD##*/}

    if [ -e "$bookmarkToFolder" ];then
        echo "Bookmark $bookmarkToFolder exists"
    else
        cd $HOME/.bookmarks
        if [ -z "$1" ]
        then
            ln -s $currentDirectoryPath "@"$currentDirectoryName
            echo "Created bookmark @$currentDirectoryName in $HOME/.bookmarks"
        else
            ln -s $currentDirectoryPath "@"$1
            echo "Created bookmark @$1 in $HOME/.bookmarks"
        fi
        cd $currentDirectoryPath
    fi
}
# Delete bookmark
deleteSymlinkBookmark(){
    bookmarkName=$1
    currentDirectoryPath=$PWD
    if [ ! -z "$bookmarkName" ]; then
	    bookmarkToDelete="$HOME/.bookmarks/@$bookmarkName"
        if [ -e "$bookmarkToDelete" ]
        then
            rm $bookmarkToDelete
            echo "Deleted bookmark $bookmarkToDelete"
        else
            echo "No bookmark $bookmarkName found."
            echo "Current bookmarks:"
            cd ~/.bookmarks
            ls -ld * | awk '{print "\033[36m" $9 "\033[0m" " " $10 "\033[34m" " " $11}'
            cd $currentDirectoryPath
        fi
    else
        echo "Specify a bookmarkname to delete:"
        cd ~/.bookmarks
        ls -ld * | awk '{print "\033[36m" $9 "\033[0m" " " $10 "\033[34m" " " $11}'
        cd $currentDirectoryPath
    fi
}
# List all bookmarks with colorcoding
listAllBookmarksWithColorCoding(){
    currentDirectoryPath=$PWD
    cd ~/.bookmarks
    ls -ld * | awk '{print "\033[36m" $9 "\033[0m" " " $10 "\033[34m" " " $11}'
    cd $currentDirectoryPath
}

countallsubfoldersindir(){
    find . -type d -print0 | while read -d '' -r dir; do
        files=("$dir"/*)
        printf "%5d files in directory %s\n" "${#files[@]}" "$dir"
    done
}

# create .tar.gz 
targz() { tar -zcvf $1.tgz $1; rm -r $1; }
# extract .tar.gz
untargz() { tar -zxvf $1; rm -r $1; }
