
#! bash oh-my-bash.module
#  ---------------------------------------------------------------------------

# Directory Listing aliases
alias dir='ls -hFx'
alias l.='ls -d .* --color' # short listing, only hidden files - .*
alias l='ls -lathF --color'             # long, sort by newest to oldest
alias L='ls -latrhF --color'            # long, sort by oldest to newest
alias la='ls -A --color'                # show hidden files
alias lc='ls -lcr --color'              # sort by change time
alias lk='ls -lSr --color'              # sort by size
alias lh='ls -lSrh --color'             # sort by size human readable
alias ll='ls -al --color | less'        # pipe through 'more'
alias lo='ls -laSFh'            # sort by size largest to smallest
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lu='ls -lur'              # sort by access time


#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias dud='du -d 1 -h'                      # Short and human-readable directory listing
alias duf='du -sh *'                        # Short and human-readable file listing
