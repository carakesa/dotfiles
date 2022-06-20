
# ----- General ---------------------------------------------------------------

# colorize grep and ls
alias grep &> /dev/null || alias grep="grep --color=auto"
#alias ls='ls -p --color=auto -w $(($COLUMNS<120?$COLUMNS:120))'
alias l='ls -p --color=auto -w $(($COLUMNS<120?$COLUMNS:120))'
alias ll='ls -lp --color=auto'
alias la='ls -ap --color=auto -w $((COLUMNS<120?$COLUMNS:120))'

# Remove Package Orphans (pacman)
alias paclean='sudo pacman -Qtdq | pacman -Rns -'

# 'r' in zsh is set up to repeat the last command (!!)
alias r="true"

# manipulate files verbosely (print log of what happened)
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"

# so much easier to type than `cd ..`
alias cdd="cd .."
alias cddd="cd ../.."
alias cdddd="cd ../../.."
alias cddddd="cd ../../../.."
alias cdddddd="cd ../../../../.."
alias cddddddd="cd ../../../../../.."

# use popd to navigate directory stack (like "Back" in a browser)
alias b="popd"

# Redirect stderr and stdout when using GRC
which grc &> /dev/null && alias grc="grc -es"

# Todo List
alias todo="nano ~/.dotfiles/todo"

# look up LaTeX documentation
which texdef &> /dev/null && alias latexdef="texdef --tex latex"

# Easily download an MP3 from youtube on the command line
alias youtube-mp3="noglob youtube-dl --extract-audio --audio-format mp3"

which doctoc &> /dev/null && alias doctoc='doctoc --title="## Table of Contents"'

# Pretend that tmux is XDG Base Directory conformant
#which tmux &> /dev/null && alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

# Use --no-bold for Solarized colors
alias icdiff="icdiff --no-bold"

# dump syntax highlighted file to screen
alias hicat='highlight -O truecolor --style=solarized-$SOLARIZED'

# Node module for lorem-ipsum
alias words="lorem-ipsum --units words --count"
alias paras="lorem-ipsum --units paragraphs --count"

# Show a summary of my jrnl. 'viewjrnl' is defined in https://github.com/jez/bin
#alias jrnlsum="viewjrnl -from '10 days ago'"

# ----- aliases that are actually full-blown commands -------------------------

# list disk usage statistics for the current folder (Disk Free Here -human readable)
alias dfhh="du -h -d1 | sort -hr"

# print my IP
alias myip="curl ifconfig.co"
alias myipv4="curl -4 ifconfig.co"
alias myipv6="curl -6 ifconfig.co"

# resolve a symlink in the PWD to a fully qualified directory
#alias resolve='cd "`pwd -P`"'

# How much memory is Chrome using right now?
#alias chromemem="ps -ev | grep -i chrome | awk '{print \$12}' | awk '{for(i=1;i<=NF;i++)s+=\$i}END{print s}'"

# Re-export SSH_AUTH_SOCK using value from outside tmux
#alias reauthsock='eval "export $(tmux showenv SSH_AUTH_SOCK)"'

# Remove garbage files
alias purgeswp="find . -regex '.*.swp$' | xargs rm"
alias purgedrive='find ~/GoogleDrive/ -name Icon -exec rm -f {} \; -print'
alias purgeicon='find . -name Icon -exec rm -f {} \; -print'

# Takes output like 'foo.txt:12: ...' (i.e., output from git grep --line)
# and keeps only the foo.txt:12 part
alias fileline="cut -d : -f 1-2"
alias onlyloclines="sed -e '/^ /d; /^$/d; /^Errors:/d'"
alias onlylocs="onlyloclines | fileline"

# Given input like foo.txt:12 on their own lines, +1 / -1 to all the line numbers
alias nextline="awk 'BEGIN { FS = \":\"} {print \$1 \":\" (\$2 + 1)}'"
alias prevline="awk 'BEGIN { FS = \":\"} {print \$1 \":\" (\$2 - 1)}'"

# ----- Linux specific --------------------------------------------------------

# edit: commenting this out for now 6/15/2022

# it doesn't make sense to repeat this for each specific host;
# it's Linux specific
#if [ "$(uname)" = "Linux" ]; then
#  which tree &> /dev/null && alias tree="tree -C -F --dirsfirst"
#else
#  which tree &> /dev/null && alias tree="tree -F --dirsfirst"
#fi

# if tree doesn't exist, the return condition will be false when we exit
#true
