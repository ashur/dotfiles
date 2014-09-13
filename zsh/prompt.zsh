# ----------------------------------------------------------------------------
# Using bits from Steve Losh
#	http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Shows little symbol '±' if you're currently at a git repo,
#                     '☿' if you're currently at a hg repo,
#                     '⚡' if you're currently at a svn repo,
#                 and '○' all other times
# ----------------------------------------------------------------------------
function prompt_char {
    # git branch >/dev/null 2>/dev/null && echo '±>' && return
    # hg root >/dev/null 2>/dev/null && echo '☿>' && return
    # svn info >/dev/null 2>/dev/null && echo '⚡>' && return
    echo '>'
}

# ----------------------------------------------------------------------------
# svn prompt
# based on: https://gist.github.com/1156969 
# with help from: http://andrewray.me/bash-prompt-builder/index.html
# 
# Only the root directory holds the .svn repository. We need to test each directory in the current
# directory's path to determine if we are under Subversion control.
# ----------------------------------------------------------------------------
function svn_prompt_info {
	# Set up defaults
	local svn_branch=""
	local svn_repository=""
	local svn_version=""
	local svn_change=""

	# if `svn info` returns more than 1 line, we are under subversion control
  testsvn=`svn info &> /dev/null | wc -l`
  if [ $testsvn -gt 1 ] ; then
		# query svn info and parse the results
		svn_branch=`svn info | grep '^URL:' | egrep -o '((tags|branches)/[^/]+|trunk).*' | sed -E -e 's/^(branches|tags)\///g'`
		svn_repository=`svn info | grep '^Repository Root:' | egrep -o '(http|https|file|svn|svn+ssh)/[^/]+' | egrep -o '[^/]+$'`
		svn_version=`svnversion -n`
		
		# this is the slowest test of the bunch
		change_count=`svn status | grep "?\|\!\|M\|A" | wc -l`
		if [ "$change_count" != "       0" ]; then
			svn_change=" [dirty]"
		else
			svn_change=""
		fi
		
		# show the results
		echo "%{$fg[blue]%}$svn_repository%{$reset_color%}/%{$fg[green]%}$svn_branch %{$reset_color%}@ %{$fg[cyan]%}$svn_version%{$reset_color%}%{$fg[yellow]%}$svn_change%{$reset_color%}"
		
	fi
}

# ----------------------------------------------------------------------------
# git prompt variables
# ----------------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} [dirty]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} [untracked]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ----------------------------------------------------------------------------
# zee prompt (ha ha)
# ----------------------------------------------------------------------------
directory_name(){
  echo "%{$fg[green]%}%1~ %{$reset_color%}"
}

username() {
	echo "%{$fg[red]%}%n%{$reset_color%}"
}

machine_name() {
	echo "%{$fg[yellow]%}%m%{$reset_color%}"
}

if [[ -n $SSH_CONNECTION ]]; then
	export PS1="[$(username) @ $(machine_name)] $(directory_name)$(prompt_char)"
else
	export PS1="[$(username)] $(directory_name)$(prompt_char)"
fi

# ----------------------------------------------------------------------------
# error prompt
# ----------------------------------------------------------------------------
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# ----------------------------------------------------------------------------
# rubies are red, and so my Ruby version is too
#-----------------------------------------------------------------------------

export RPS1='$(git_prompt_info)$(svn_prompt_info)'

# ----------------------------------------------------------------------------
# determine the Ruby version for the right prompt
#-----------------------------------------------------------------------------
function rvm_ruby_prompt {
  ruby_version=$(~/.rvm/bin/rvm-prompt)
  if [ -n "$ruby_version" ]; then
    echo "$ruby_version"
  fi
}

if [[ -n $SSH_CONNECTION ]]; then
	function settab { print -Pn "\e]1;%n@%m: %~\a" }
	function settitle { print -Pn "\e]2;%n@%m: %~\a" }
else
	function settab { print -Pn "\e]1;%n: %~\a" }
	function settitle { print -Pn "\e]2;%n: %~\a" }
fi

function precmd {
	settitle
	settab
}
