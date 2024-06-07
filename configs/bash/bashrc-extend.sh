
# Extend your default .bashrc with this file.
# Fell free to customize it to your needs.

# History search with arrow keys
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# Basic aliases
alias nv="nvim"
alias ls='ls --color=auto --group-directories-first'

# Tmux with tmux.conf
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
