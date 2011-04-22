# =====
# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ben/.zshrc'

autoload -Uz compinit
compinit


# =====
# OS X lines from http://hocuspokus.net/2008/01/a-better-ls-for-mac-os-x/
# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `dircolors ~/.dir_colors`
fi

# Useful aliases
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."
alias rm='rm -i'
alias lf='find . -type f -print | xargs ls -alh | sort -k5,5rn | head -50'
alias ve='virtualenv --no-site-packages .'
alias activate='. bin/activate'

# =====
# Lines from Mark

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

# correction
setopt correctall

# prompt
autoload -U promptinit
promptinit

autoload -U colors
colors

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# # for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# # for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
