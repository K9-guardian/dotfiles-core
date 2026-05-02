# .bashrc
# vim:foldmethod=marker ft=bash

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

[ -f "$HOME/.bashrc.d/preinit.bash" ] && . "$HOME/.bashrc.d/preinit.bash"

# Prompt {{{
if tput colors &>/dev/null && [ "$(tput colors)" -ge 8 ]; then
  LITTLE_MAN='$(if [ $? = 0 ]; then echo "\[\e[32m\]\\o/\[\e[0m\]"; else echo "\[\e[31m\]/o\\\[\e[0m\]"; fi)'
else
  LITTLE_MAN='$(if [ $? = 0 ]; then echo "\\o/"; else echo "/o\\"; fi)'
fi
PS1="($LITTLE_MAN):\w $ "
# }}}

# Defaults {{{
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Disable screen reader support (needed for poppler)
export NO_AT_BRIDGE=1

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Set up completion/keybinds for applications
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"
command -v atuin >/dev/null 2>&1 && eval "$(atuin init bash --disable-up-arrow)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd bash)"
# }}}

# Aliases {{{
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --time-style "+%b %d %I:%M %p" --icons=auto'
  alias tree='ls --tree'
elif ls --group-directories-first >/dev/null 2>&1; then
  alias ls='ls --color=auto --group-directories-first'
elif ls -G >/dev/null 2>&1; then
  alias ls='ls -G'
fi

alias la='ls -a'
alias ll='ls -la'

if command -v nvim >/dev/null 2>&1; then
  alias ex='nvim -e'
  alias vi='nvim'
  alias view='nvim -R'
  alias vim='nvim'
  alias vimdiff='nvim -d'
fi

command -v bat >/dev/null 2>&1 && alias cat='bat'
command -v kitty >/dev/null 2>&1 && alias icat='kitten icat --align left'

alias ..='cd ..'
alias gr='cd "$(git rev-parse --show-toplevel)"'
# }}}

[ -f "$HOME/.bashrc.d/postinit.bash" ] && . "$HOME/.bashrc.d/postinit.bash"

[ -f $HOME/.bash-preexec.sh ] && . "$HOME/.bash-preexec.sh"
