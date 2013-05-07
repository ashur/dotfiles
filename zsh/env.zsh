# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

# Put Homebrew at the head of the path
# /usr/local/bin is also first in /etc/paths

export PATH="/usr/local/bin:$HOME/.dotfiles/bin:$PATH"

if [[ `uname` == 'Darwin' ]]; then
	export LESSEDIT='mate -l %lm %f'
	export EDITOR='mate_wait'
	export TOOLS=$HOME/Developer/Jenkins/tools
	export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/
else
	export EDITOR='rmate'
	export LESSEDIT=nano
fi

if [[ `uname` == 'Darwin' ]]; then
	export PATH="$PATH:$TOOLS"
else
  export PATH=~/.gems/bin:/usr/lib/ruby/gems/1.8/bin:$PATH
fi

export MANPATH="/usr/local/man:$MANPATH"

export PAGER=less
export LESS="-F -X -R"
export GREP_OPTIONS='--exclude=\*.svn\*'  
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR=nano
	export LESSEDIT=nano
fi
