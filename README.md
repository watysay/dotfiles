# DOTFILES
---------------

Thoses are my dofiles. I use it.

Manage with GNU stow.


%fn
"find . -maxdepth 1 -type d ! -name ".*" -printf "%f\n"
find . -maxdepth 1 -type d ! -name ".*" -printf "%f\n" | xargs stow -Dvn
find . -maxdepth 1 -type d ! -name ".*" -printf "%f\n" | xargs stow -Rv # R restow (delete+stow) 
