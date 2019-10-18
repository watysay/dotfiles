# DOTFILES
---------------

Thoses are my dofiles. I use it.

Manage with GNU stow.

```
cd <dotfiles_repo>
declare -a dir_arr=( atom bash git input vim )
for dir in ${dir_arr[@]}; do
  stow -Rv ${dir}
done

ln -s $(find $PWD -name "dircolors.ansi-dark") $HOME/.dircolors
```

# NOTES
---------------

Git completion/prompt should be OK 
Installed by default, respectively at
/usr/share/bash-completion/completions/git and
/usr/lib/git-core/git-sh-prompt

If not, 
```
wget https://raw.githubusercontent.com/git/git/v$(git --version | awk '{ print $3 }')/contrib/completion/git-prompt.sh -O /etc/bash_completion.d/git-prompt.sh
wget https://raw.githubusercontent.com/git/git/v$(git --version | awk '{ print $3 }')/contrib/completion/git-completion.bash -O /etc/bash_completion.d/git-completion.bash
```
(sourcing them in ~/.bashrc should be already done)


ajout d'un submodule pour vim
```
git submodule add https:\\..../<name> vim/.vim/bundle/<name>
```


ajout de solarized pour MATE terminal:
```
git clone https://github.com/cledoux/mate-terminal-colors-solarized.git
cd mate-terminal-colors-solarized
./install.sh
```

#TODO
---------------

- [] add apt-get curl
