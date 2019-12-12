# liste des operations a mener
# 1) backup des fichiers si ce ne sont pas des liens
# 2) création des liens
#  ln -s PWD/bash_aliases ~/.bash_aliases
#  ln -s PWD/bashrc       ~/.bashrc
#  ln -s PWD/bash_video   ~/.bash_video
#  ln -s PWD/dircolors    ~/.dircolors
#  ln -s PWD/gitconfig    ~/.gitconfig
#  ln -s PWD/inputrc      ~/.inputrc
#  ln -s PWD/vim/         ~/.vim
#
#  All credits to odolbeau : https://github.com/odolbeau/dot-files/blob/master/Makefile
.PHONY: ${TARGETS}

install: prepare_install
	# Install dot files
	@if [ ! -L ${HOME}/.bashrc ];       then ln -s ${CURDIR}/bashrc         ~/.bashrc        ;fi
	@if [ ! -L ${HOME}/.bash_aliases ]; then ln -s ${CURDIR}/bash_aliases   ~/.bash_aliases  ;fi
	@if [ ! -L ${HOME}/.bash_video ];   then ln -s ${CURDIR}/bash_video     ~/.bash_video    ;fi
	@if [ ! -L ${HOME}/.dircolors ];    then ln -s ${CURDIR}/dircolors      ~/.dircolors     ;fi
	@if [ ! -L ${HOME}/.inputrc ];      then ln -s ${CURDIR}/inputrc        ~/.inputrc       ;fi
	@if [ ! -L ${HOME}/.vim ];          then ln -s ${CURDIR}/vim            ~/.vim           ;fi

	# Create ~/.config folder if needed
 	@if [ ! -d ${HOME}/.config ]; then mkdir ~/.config; fi
	
	# Install config applications
	@if [ ! -L ${HOME}/.config/terminator ]; then ln -s ${CURDIR}/config/terminator ~/.config/terminator; fi 

prepare_install:
	@if [ -f ${HOME}/.bashrc ] && [ ! -L ${HOME}/.bashrc ]; then rm ${HOME}/.bashrc; fi
