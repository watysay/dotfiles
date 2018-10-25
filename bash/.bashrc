# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


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
# PROMPT AND COLOR
#---------------------------------------------------

## source git prompt data
# preliminery settings
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
# source file - ajout d'une gestion Git dans le PS1
. /usr/lib/git-core/git-sh-prompt

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM=xterm-256color
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    # version precedente, pas de pb visuel sur affichage ligne de commande precedente
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
	# nouvelle version de test
    # ajout de __git_ps1 pour gerer la position (master, branch)
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[00;34m\][\A]\[\033[00m\] \[\033[00;32m\]\w\[\033[00m\] $(__git_ps1 "(%s)")\$ '

else
    PS1='${debian_chroot:+($debian_chroot)}\W \$ '
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

# Alias definitions.
# You may want to put all your additions into a separate file like
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

# export de PATH pour eclipse
export PATH=~/prog/eclipse/eclipse/eclipse/:$PATH
export ECLIPSE_HOME="~/prog/eclipse/eclipse/eclipse"

# export de PATH pour dossier scripts
export PATH=~/scripts:$PATH

# export de CLASSPATH pour le JDBC - driver de connexion Java-MySQL
export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java-5.1.28.jar

# export de l'editeur par défaut
export EDITOR=vi

export PATH="/home/seb/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/seb/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/seb/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/seb/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/seb/perl5"

# if need be for VM installations (VMWare)
[[ -f ~/.bash_video ]] && . ~/.bash_video && set1080p
