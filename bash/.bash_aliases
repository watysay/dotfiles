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
