# ~/.bash_aliases : contient les alias de cet utilisateur
# ce fichier est automatiquement sourcé par .bashrc

##########################################
# Color handling
##########################################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

##########################################
# Aliases - ls
##########################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -1F'
alias l.='ls -lAd .* | grep -v /'
alias lz='ls -1'
alias lsp='ls -d1 $PWD/*'

##########################################
# Aliases - apt
##########################################
alias sinstall='sudo -E apt-get install'
alias supdate='sudo -E apt-get update'
alias supgrade='sudo -E apt-get upgrade'

##########################################
# Aliases - Git
##########################################
alias gc='git commit'
alias ga='git add'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias go='git checkout '
alias gt='git tag -n'

gac(){

  git add $1 && git commit -m "$2"

}
# add auto-completion for bash aliases to git
# call __git_complete to alias, linked to 
# func "_git_"<command in alias>
# retrieve list :
# alias | grep git | sed "s/=/ /g; s/'//g" | awk '{print "__git_complete "$2" _git_"$4 }'
__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gc _git_commit
__git_complete gcm _git_commit
__git_complete gd _git_diff
__git_complete go _git_checkout
__git_complete gs _git_status

##########################################
# Aliases - grep
##########################################
grepssh() {
    local config_ssh=~/.ssh/config
    grep "$@" "${config_ssh}"
    unset config_ssh

}
alias sshgrep=grepssh

##########################################
# Aliases - Video
##########################################

#alias 1080p='xrandr --output VGA-1 --mode 1920x1080'
alias 768p='xrandr --output VGA-1 --mode 1366x768'

set1080p(){

local var=$(xrandr | grep VGA | wc -l)
local current=$(xrandr | grep 'connected primary 1920x1080' | wc -l)
local is1080exist=$(xrandr | egrep '^\s+1920x1080' | wc -l)

if [ "$var" -eq 0 ]; then
  output="Virtual1"
else
  output="VGA-1"
fi

if [ "$is1080exist" -eq 0 ]; then
  xrandr --newmode "1920x1080" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
  xrandr --addmode ${output} 1920x1080
fi

if [ "$current" -eq 0 ]; then
  xrandr --output ${output} --mode 1920x1080
fi


}

##########################################
# Aliases - Ansible
##########################################

apb(){
  local t=$(date)
  ansible-playbook --ask-vault-pass -i $@
  echo "Debut: $t"
  echo "Fin  : $(date)"
}



bootstrap_role(){
  role_name="$1"
  if [ -d ".git" ]; then
    mkdir -p roles/${role_name}/tasks/
    echo -e "---\n- import_tasks: ${role_name}.yml" > roles/${role_name}/tasks/main.yml
    echo -e "---\n" > roles/${role_name}/tasks/${role_name}.yml
  else
    echo "We are not in a GIT folder !" 1>&2
  fi
}

ansible-shell(){
  local pattern="$1"
  local command="$2"

  if [[ ${pattern} = "-h" ]]; then
     echo "Launch shell command on several hosts"
     echo "1st param: inventory file"
     echo "2nd param: pattern to match (hosts list)"
     echo "3rd param: command to pass"
     echo "example: ansible-shell hosts.txt \"EMAG\" \"ls /meti/emag/conf\""
     echo "Don't forget to quote the parameters !"

  else
    cd /home/smanic/ansible-CRFRO-reference
    ansible --ask-vault-pass -i main_ansible_inventory_CRFRO "${pattern}" -m shell -a "${command}"
  fi
}


##########################################
# Generic aliases
##########################################
alias cls='clear'
alias virc='vi ~/.bashrc && . ~/.bashrc'
alias cd..='cd ..'
alias shutdown_rpi='ssh pi@raspberrypi "sudo shutdown -h +5"'

##########################################
# Generic functions
##########################################
startswith() {
    find . -maxdepth 1 -name "${1}*" | sort
}

rootfind() {
	find / -name "$1" 2> /dev/null
}

fluflux() {
	nb=$(pgrep xflux | wc -l)
	if [ $nb -lt 2 ] # moins de 2 process lancés = pas de collision
	then
	    echo "Lancement de xflux !"
	    #xflux -l 40 2>&1 1> /dev/null
	else
		echo "xflux tourne déjà !"
	fi
}

mkdircd() {
	mkdir -p $1 && 	cd $1

}


