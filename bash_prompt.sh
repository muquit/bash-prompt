########################################################################
# ~/.bash_prompt.sh - git-aware bash prompt config
#
# git info (branch, user) only appears inside a git repository.
# User identity is useful for catching wrong git credentials
# across personal/work repos.
#
# Source this file from ~/.bashrc:
#   [[ -f ~/.bash_prompt.sh ]] && source ~/.bash_prompt.sh
#
# Make sure ~/.bash_profile sources ~/.bashrc so login shells
# also pick this up:
#   [[ -f ~/.bashrc ]] && source ~/.bashrc
#
# Project URL: https://github.com/muquit/bash-prompt
########################################################################

# Default decorator character. Set to empty string to disable.
PROMPT_DECORATOR="★"
# To override, add any Unicode character to ~/.bash_prompt_decor.txt
PROMPT_DECOR_FILE="$HOME/.bash_prompt_decor.txt"
[[ -f "$PROMPT_DECOR_FILE" ]] && PROMPT_DECORATOR=$(cat "$PROMPT_DECOR_FILE")

parse_git_branch() {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

parse_git_user() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    local name
    name=$(git config user.name 2>/dev/null)
    [[ -n "$name" ]] && echo "‹${name}›"
}

set_bash_prompt() {
    local -r black="\001$(tput setaf 0)\002"
    local -r red="\001$(tput setaf 1)\002"
    local -r green="\001$(tput setaf 2)\002"
    local -r yellow="\001$(tput setaf 3)\002"
    local -r blue="\001$(tput setaf 4)\002"
    local -r magenta="\001$(tput setaf 5)\002"
    local -r cyan="\001$(tput setaf 6)\002"
    local -r white="\001$(tput setaf 7)\002"
    local -r dim="\001$(tput dim)\002"
    local -r bold="\001$(tput bold)\002"
    local -r normal="\001$(tput sgr0)\002"
    PS1="$green[\u@\h]"
    PS1+="${magenta}\w${yellow}\$(parse_git_branch)${dim}\$(parse_git_user)${normal}\r\n${cyan}[\D{%r}]${red}\h]${yellow}${PROMPT_DECORATOR} ${white}➤${normal} "
}
set_bash_prompt
# A sample prompt. I'm inside mailsend-go repo: the prompt looks 
# something like:
#
#[muquit@cygnal]~/gitdev/mailsend-go(master)‹muquit›
#[02:24:10 PM]cygnal]⚡➤
#
# master is the branch. <muquit> is my username in ~/.gitconfig
# They will show up only when inside a git repo.

