# lietrust dotfiles

My dotfiles for a Debian machine.  
It is more of setup script for intial install than just a collection of dotfiles.  
It installs the packages I need and sets up my environment.  

## Installation

Run from your `$HOME` directory
```
git clone https://github.com/lietrust/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

The repo must live in `~/.dotfiles` because the scripts rely on that path.  
After installation edit `.gitconfig` to set your own git name and email.  

## What you get

**Dev:** 
- gcc (compiler)
- make

**Env:** 
- dwm (window manager)
- dmenu
- surf (browser)
- st (terminal)
