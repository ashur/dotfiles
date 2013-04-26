export PATH="/usr/local/bin:/usr/local/sbin:$ZSH/bin:/sbin:/usr/sbin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
	export PATH="$PATH:$TOOLS"
else
  export PATH=~/.gems/bin:/usr/lib/ruby/gems/1.8/bin:$PATH
fi

export MANPATH="/usr/local/man:$MANPATH"