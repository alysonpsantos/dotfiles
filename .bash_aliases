# shortcuts
alias q='exit'
alias c='clear'
alias h='history'
alias cls='clear;ls'
alias src='source ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# important directories
alias home='cd ~/'
alias root='cd /'

# safer remove
alias rm='rm --interactive'

# newsboat
alias nb='newsboat'

# grep
alias grep='grep --color=auto'

# ls
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias l='ls -1'
alias ll='la | less'

# tree
alias t1='tree -C -L 1 | less -R --quit-if-one-screen'
alias t2='tree -C -L 2 | less -R --quit-if-one-screen'
alias t3='tree -C -L 3 | less -R --quit-if-one-screen'
alias tt='tree -C | less -R --quit-if-one-screen'

# tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-server'

# tmuxp
alias tl='tmuxp load'
alias tf='tmuxp freeze'

# git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
