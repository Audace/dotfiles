#!/bin/sh

git submodule init
git submodule update

DOTFILES=".emacs.d .zshrc .gitconfig .gitignore .ackrc .tmux.conf .cmd-key-happy.lua"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"
DOTFILES_DIR=$PWD

for FILE in $DOTFILES; do
    if [ -e "$HOME/$FILE" ]; then
        if [ -L "$HOME/$FILE" ]; then
            echo "Not backing up ~/$FILE, it is a symlink -> `readlink $HOME/$FILE`. Deleting symlink instead."
            rm "$HOME/$FILE"
        else
            echo "Backing up ~/$FILE"
            mkdir -p $BACKUP
            mv "$HOME/$FILE" "$BACKUP/$FILE"
        fi
    fi
    echo "installing $FILE"
    ln -s "$DOTFILES_DIR/$FILE" "$HOME/$FILE"
done
