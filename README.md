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

ln -s dircolors-solarized-master/dircolors.ansi-dark $HOME/.dircolors
```
