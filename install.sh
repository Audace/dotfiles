#!/usr/bin/env sh

set -e

DOTFILES=".dir_colors .gitconfig .gitignore .ackrc .tmux.conf .screenrc .zshrc .emacs.d/init.el .emacs.d/ben.el .ssh/rc bin/git-opendiff"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"

for FILE in $DOTFILES; do
    DEST_PATH="$HOME/$FILE"

    # Create directory if it doesn't exist
    DEST_DIR=`dirname $DEST_PATH`
    if [ ! -d $DEST_DIR ] ; then
        mkdir -p $DEST_DIR
    fi

    # Copy file if it doesn't exist
    if [ -e $DEST_PATH ] || [ -L $DEST_PATH ]; then
        echo "Backing up $DEST_PATH to $BACKUP/$FILE"
        mkdir -p `dirname $BACKUP/$FILE`
        mv $DEST_PATH $BACKUP/$FILE
    fi

    echo "Installing $DEST_PATH"
    ln -s $HOME/dotfiles/$FILE $DEST_PATH
done
