export PATH="/usr/local/bin:/usr/local/sbin:$ZSH/bin:/sbin:/usr/sbin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
	export PATH="$PATH:$TOOLS"
fi

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"