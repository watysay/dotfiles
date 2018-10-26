# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#---------------------------------------------------
# PATH
#---------------------------------------------------
# export de PATH pour eclipse
export PATH=~/prog/eclipse/eclipse/eclipse/:$PATH
# export de PATH pour dossier scripts
export PATH=~/scripts:$PATH
export PATH="/home/seb/perl5/bin${PATH:+:${PATH}}"

#---------------------------------------------------
# ENV SETTINGS
#---------------------------------------------------
export ECLIPSE_HOME="~/prog/eclipse/eclipse/eclipse"

# export de CLASSPATH pour le JDBC - driver de connexion Java-MySQL
export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java-5.1.28.jar

export PERL5LIB="/home/seb/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/seb/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/seb/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/seb/perl5"

# export de l'editeur par défaut
export VISUAL="vim"
export EDITOR="vim"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#---------------------------------------------------
# COMPLETION
#---------------------------------------------------
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

#---------------------------------------------------
# PROMPT AND COLOR
#---------------------------------------------------
# GIT PS1 settings
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"
#export GIT_PS1_SHOWCOLORHINTS=1 #only works when setting PROMPT_COMMAND, not PS1

#---------------------------------------------------
# PROMPT AND COLOR
#---------------------------------------------------
# source file - ajout d'une gestion Git dans le PS1
. /usr/lib/git-core/git-sh-prompt

if [[ "$TERM" = "xterm" ]] && [[ -n "$COLORTERM" ]]; then
  TERM=xterm-256color
else
  : # on ne touche pas aux variables
fi

# definition des couleurs
if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 64);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 196);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 136);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;

# Set the terminal title and prompt.
PS1="\[${orange}\]\u@\h"; # username@host
PS1+="\[${white}\]:";
PS1+="\[${blue}\]\w"; # working directory full path
PS1+="\[${green}\] $(__git_ps1 "(%s)")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

#---------------------------------------------------
# ALIASES AND FUNCTIONS
#---------------------------------------------------
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# if need be for VM installations (VMWare)
[[ -f ~/.bash_video ]] && . ~/.bash_video && set1080p
