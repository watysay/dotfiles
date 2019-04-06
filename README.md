# DOTFILES
---------------

Thoses are my dofiles. I use it.

Manage with GNU stow.

```
find . -maxdepth 1 -type d ! -name ".*" -printf "%f\n" | xargs stow -Rv # R restow (delete+stow) 
```

#TODO
- [] add apt-get curl
