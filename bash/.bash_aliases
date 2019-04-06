# ~/.bash_aliases : contient les alias de cet utilisateur
# ce fichier est automatiquement sourcé par .bashrc

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#fi

# Aliases pour ls
alias ll='ls -alF --color=auto'
alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias l='ls -1F --color=auto'
alias l.='ls -lAd .* | grep -v /'
alias lz='ls -1 --color=auto'
alias lsp='ls -d1 --color=auto $PWD/*'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias pour afficher un message : lancer notify + message
alias notify='notify-send --urgency=low -i "$(echo terminal)" -t 5000'

# Alias divers
alias cls='clear'
alias virc='vi ~/.bashrc && . ~/.bashrc'
alias cd..='cd ..'

alias shutdown_rpi='ssh pi@raspberrypi "sudo shutdown -h +5"'

# a mettre dans les fonctions plus tard
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




# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
## check bash_aliases for more

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


##########################################
# Aliases - Navigation
##########################################
alias l='ls -1F'
alias cd..='cd ..'


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
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'

gac(){

  git add $1 && git commit -m "$2"

}

#####################
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
alias apb='ansible-playbook --ask-vault-pass -i '

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
  local inventory="$1"
  local pattern="$2"
  local command="$3"

  if [[ ${inventory} = "-h" ]]; then
     echo "Launch shell command on several hosts"
     echo "1st param: inventory file"
     echo "2nd param: pattern to match (hosts list)"
     echo "3rd param: command to pass"
     echo "example: ansible-shell hosts.txt \"EMAG\" \"ls /meti/emag/conf\""
     echo "Don't forget to quote the parameters !"

  else
    ansible --ask-vault-pass -i "${inventory}" "${pattern}" -m shell -a "${command}"
  fi
}
