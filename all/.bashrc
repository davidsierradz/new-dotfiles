#!/usr/bin/env bash
stty -ixon      # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
shopt -s histappend
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'
# Infinite history.
HISTSIZE=
HISTFILESIZE=
