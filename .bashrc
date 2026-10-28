# Save history in history folder
export HISTFILE="$HOME/.dotfiles/history/.bash_history"
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=1000


export TERM=xterm-256color
PS1='[\u@\h:\W]\$ '


alias ls="ls -lv --color=auto"
alias grep="grep --color=auto"


if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi


rm -f "$HOME/.sudo_as_admin_successful" "$HOME/.bash_logout" "$HOME/.profile" 2>/dev/null
