export PATH="/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
	export PATH="$PATH:$TOOLS"
else
  export PATH=~/.gems/bin:/usr/lib/ruby/gems/1.8/bin:$PATH
fi

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"