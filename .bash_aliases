# shortcuts
alias q='exit'
alias c='clear'
alias h='history'
alias src='source ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# important directories
alias home='cd ~/'
alias root='cd /'

# safer remove
alias rm='rm --interactive'

# git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

# dotfiles (git)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dots='dot status'
alias dota='dot add'
alias dotaa='dot add --all'
alias dotc='dot commit'

# git workflow
alias readme='touch README.md'

# grep
alias grep='grep --color=auto'

# ls
alias ls='ls --color=auto'
alias la='clear;ls -A'
alias l='clear;ls -1'
alias ll='ls -al --color=auto | less -R'

# newsboat
alias nb='newsboat'

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

