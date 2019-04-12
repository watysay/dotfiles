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

If not, wget :
https://raw.githubusercontent.com/git/git/v$(git --version | awk '{ print $3 }')/contrib/completion/git-prompt.sh
https://raw.githubusercontent.com/git/git/v$(git --version | awk '{ print $3 }')/contrib/completion/git-completion.bash

and sourcing them in ~/.bashrc should be enough


#TODO
---------------

- [] add apt-get curl
### TODO : install git sur nvl machine pr test si git_complete existe
