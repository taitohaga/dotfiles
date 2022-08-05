#!/usr/bin/env bash

set -ue

DOTDIR="$HOME/dotfiles"

helpmsg() {
    command echo "Usage: $0 [--help | -h]" 0>&2
    command echo ""
}

download_repo() {
    if type "git" > /dev/null 2>&1; then
        if [ ! -d "$DOTDIR" ]; then
            git clone https://github.com/taitohaga/dotfiles.git $DOTDIR
        else
            echo "$DOTDIR already exists. Quitting..."
            exit 1
        fi
    else
        echo "git required"
        exit 1
    fi

}

link_to_homedir() {
    command echo "back up old dotfiles..."

    if [ ! -d "$HOME/.dotbackup" ]; then
        command echo "$HOME/.dotbackup was not found. Creating..."
        command mkdir "$HOME/.dotbackup"
    fi

    if [ "$HOME" != "$DOTDIR" ]; then
        for f in $DOTDIR/.??*; do
            if [ `basename $f` == ".git" ]; then
                continue
            fi
            if [ `basename $f` == ".gitignore" ]; then
                continue
            fi
            if [ `basename $f` == "README.md" ]; then
                continue
            fi
            if [ `basename $f` == "install.sh" ]; then
                continue
            fi
            if [ `basename $f` == "install.bat" ]; then
                continue
            fi
            
            if [ -L "$HOME/`basename $f`" ]; then
                command rm -f "$HOME/`basename $f`"
            fi
            if [ -e "$HOME/`basename $f`" ]; then
                command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            command ln -snf $f $HOME
        done
    else
        command echo "same install src dest"
    fi
}

while [ $# -gt 0 ];do
    case ${1} in 
        --debug|-d)
        set -uex
        ;;
        --help|-h)
        helpmsg
        exit 1
        ;;
        *)
        ;;
    esac
    shift
done

download_repo
link_to_homedir
command echo "Installation completed!"
