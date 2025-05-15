# ~/.bashrc: executed by bash(2) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export TERM=xterm-256color
#fzf goodness
source ~/.fzf.bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Define colors
RESET="\[\e[0m\]"
RED="\[\e[31m\]"
BRED="\[\e[01;31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"
MINT="\[\e[38;5;48m\]"  
PALE_BLUE="\[\e[38;5;123m\]"  
LAVENDER="\[\e[38;5;141m\]"  
EZBLUE="\[\e[38;5;69m\]"  
PINK="\[\e[38;5;219m\]"  
TAN="\[\e[38;5;222m\]"  
EZORANGE="\[\e[38;5;214m\]"  
VIOLET="\[\e[38;5;135m\]"  
CHARTREUSE="\[\e[38;5;148m\]"  
HACKERGREEN="\[\e[38;5;46m\]"  
EZBROWN="\[\e[38;5;52m\]"  
CHARCOAL="\[\e[38;5;234m\]"  
VPINK="\[\e[38;5;207m\]"  
SBLUE="\[\e[38;5;33m\]"  

# "\[[38;5;{ID}m]"


#testing area
# cat allports |grep ^[[:digit:]] |  awk -F\/ '{print $1}' | tr '\n' ',' 1 | cut -d' ' -f 2
#alias  grep -o Ports.* ports | grep -oE [[:digit:]]+/open |  tr -d '\r\n' | sed 's/\/open/,/g' | sed 's/.$//'


# template for doing jq stuff            string intrepidation? lol
#jsearch="jq -r  '.RESULTS_EXPLOIT[]| "\(.Date) \(.Path) \(.Title)"'"





##################
#custom functions#
##################

# outputs base64 from filename with no newlines or spaces
makeb64() {
  local script_content="$1"  # Access the first argument (script content)
  encoded_script=$(echo -n "$script_content" | base64)
  processed_script=${encoded_script// /}  # Remove spaces using parameter substitution
  echo "$processed_script"
}

function cls(){
  curl cheat.sh/$1 
}

# how to get docs too? maybe set var and reference twice with jc?
function jsearch(){                             #      reset term color  tab  have to quote '-'   term color red
  searchsploit $@ -j | jq -C -r  '.RESULTS_EXPLOIT[]| "\u001b[0m \(.Date) \t \(."EDB-ID")  \t \u001b[33m \(.Title)"' | sort
}

function mknames(){
  usernamer.py -f $1 -p dotted_two_terms,one_term,normal_abbreviated | grep -v '^..$'
}

function getss(){
  if [ -z "$1" ]; then
    echo "need arg fool."
  else 
    find ~/Pictures/ -maxdepth 1 -iname "*.png" -exec cp {} ~/Pictures/bak/$1 \; -exec mv {} ./$1.png \;
  fi
}

function clean-config () {
  egrep -v '^\s*#|^$' $1
}

# pull urls from ffuf output
function jfuf() {
  cat $1 | jq '.results[]| "\(.status) \(.url)"'
}


#curl each url in a ffuf output for commend (or just keywords)

function curfuf() {
  for i in `ls | grep bust`; do
    for c in `jfuf $i | cut -d" " -f2`; do  
      url=`echo $c | tr -d \"`
      curl -L -k -s $url | grep -i $1
    done
  done
}

# You may want to put all your additions into a separate file like
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTIGNORE="history:ls:pwd:cd"
#http_proxy=http://127.0.0.1:8088

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2500
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # Define prompt with git branch and other details
  if [ $(id -u) = "0" ] ; then # is root
        PS1="${CHARTREUSE}\t ${BRED}\u${HACKERGREEN}@${EZORANGE}\h ${MINT}\w ${TAN}\$(parse_git_branch) ${RED}\$(if [ \$? -eq 0 ]; then echo \"${GREEN}✔\"; else echo \"${RED}✘\"; fi) \n${RED}#${RESET} "
  else
    PS1="${CHARTREUSE}\t ${VIOLET}\u${EZBROWN}@${EZORANGE}\h ${MINT}\w ${TAN}\$(parse_git_branch) ${RED}\$(if [ \$? -eq 0 ]; then echo \"${GREEN}✔\"; else echo \"${RED}✘\"; fi)${RESET} \n$ "
  fi
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Function to extract current git branch
parse_git_branch() {
  git branch 2>/dev/null | grep '\*' | sed 's/* //'
}


# Export the PS1 variable
export PS1

# revisit atuin project
#[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
#eval "$(atuin init bash)"
