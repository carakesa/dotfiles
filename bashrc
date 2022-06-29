#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	kitty|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

#	if [[ ${EUID} == 0 ]] ; then
#		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
#	else
#		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
#	fi

 PS1='\[\e[0;38;5;39m\][\[\e[0;38;5;226m\]\d \[\e[0;38;5;226m\]@ \[\e[0;38;5;226m\]\A\[\e[0;38;5;45m\]]\[\e[0;38;5;39m\][\[\e[0;38;5;46m\]\u\[\e[0;38;5;46m\]@\[\e[0;38;5;46m\]\h\[\e[0;38;5;45m\]]\n\[\e[0;38;5;39m\][\[\e[0;38;5;82m\]\w \[\e[0;38;5;226m\](\[\e[0;38;5;226m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;38;5;226m\])\[\e[0;38;5;45m\]]\[\e[0;38;5;82m\]\$ \[\e[0m\]' 
#exa as ls
	alias l='exa'
	alias ls='exa'
	alias la='exa -a'
	alias ll='exa -l'
	alias lla='exa -la'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
        # colorize grep and ls
        alias grep &> /dev/null || alias grep="grep --color=auto"
#	alias l='ls -p --color=auto -w $(($COLUMNS<120?$COLUMNS:120))'
#	alias ll='ls -lp --color=auto'
#	alias la='ls -ap --color=auto -w $((COLUMNS<120?$COLUMNS:120))'
	alias cp="cp -v"
	alias mv="mv -v"
	alias rm="rm -v"
	alias cat="bat"	
# Pacman Aliases
	alias paclean="sudo pacman -Qtdq | sudo pacman -Rns -"
	alias pac-showorphans="pacman -Qqd | pacman -Rsu --print -"
# so much easier to type than `cd ..`
	alias cdd="cd .."
	alias cddd="cd ../.."
	alias cdddd="cd ../../.."
	alias dfhh="du -h -d1 | sort -hr"
	alias todo="nano ~/.dotfiles/todo"

else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4


PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.local/bin:
# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh
