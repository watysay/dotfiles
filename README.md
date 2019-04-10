# DOTFILES
---------------

Thoses are my dofiles. I use it.

Manage with GNU stow.

```
find . -maxdepth 1 -type d ! -name ".*" -printf "%f\n" | xargs stow -Rv # R restow (delete+stow) 
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
