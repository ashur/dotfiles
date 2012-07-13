autoload -U colors && colors
autoload -Uz vcs_info
autoload -U add-zsh-hook

zstyle ':vcs_info:*' enable svn
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

setopt prompt_subst

export __GIT_PROMPT_DIR=$ZSH/git


## Function definitions

function scm_prompt_preexec {

	if [[  "$(history $HISTCMD)" =~ ".*(svn|git|hg).*" ]]; then
			SCM_PROMPT_NEEDS_UPDATE=1
			SCM_TYPE=$match
	fi

}
typeset -a preexec_functions
preexec_functions+=scm_prompt_preexec

function precmd_update_scm_vars() {
	if [ -n "$SCM_PROMPT_NEEDS_UPDATE" ] || [ -n "$ZSH_THEME_GIT_PROMPT_NOCACHE" ]; then
		update_current_scm_vars
		unset SCM_PROMPT_NEEDS_UPDATE
	fi
}

add-zsh-hook chpwd chpwd_update_scm_vars

function chpwd_update_scm_vars() {
    update_current_scm_vars
}

function update_current_scm_vars() {
    unset __CURRENT_GIT_STATUS

    local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
    _GIT_STATUS=`python ${gitstatus}`
    __CURRENT_GIT_STATUS=("${(@f)_GIT_STATUS}")
	GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
	GIT_REMOTE=$__CURRENT_GIT_STATUS[2]
	GIT_STAGED=$__CURRENT_GIT_STATUS[3]
	GIT_CONFLICTS=$__CURRENT_GIT_STATUS[4]
	GIT_CHANGED=$__CURRENT_GIT_STATUS[5]
	GIT_UNTRACKED=$__CURRENT_GIT_STATUS[6]
	GIT_CLEAN=$__CURRENT_GIT_STATUS[7]
}

function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	svn info >/dev/null 2>/dev/null && echo '⚡' && return
	echo '%#'
}

git_super_status() {
	precmd_update_scm_vars
   if [ -n "$__CURRENT_GIT_STATUS" ]; then
	  STATUS="($GIT_BRANCH"
	  STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"
	  if [ -n "$GIT_REMOTE" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_REMOTE$GIT_REMOTE%{${reset_color}%}"
	  fi
	  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
	  if [ "$GIT_STAGED" -ne "0" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
	  fi
	  if [ "$GIT_CONFLICTS" -ne "0" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
	  fi
	  if [ "$GIT_CHANGED" -ne "0" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
	  fi
	  if [ "$GIT_UNTRACKED" -ne "0" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{${reset_color}%}"
	  fi
	  if [ "$GIT_CLEAN" -eq "1" ]; then
		  STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
	  fi
	  STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
	  echo "$STATUS"
	else
		echo ${vcs_info_msg_0_}
	fi
}



# Default values for the appearance of the prompt. Configure at will.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}✚"
ZSH_THEME_GIT_PROMPT_REMOTE=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

directory_name(){
  echo "%{$fg[green]%}%1~ %{$reset_color%}"
}

username() {
	echo "%{$fg[red]%}%n%{$reset_color%}"
}

machine_name() {
	echo "%{$fg[yellow]%}%m%{$reset_color%}"
}
precmd() {
	precmd_update_scm_vars
	settab
	settitle
  vcs_info
}


# export RPS1='${vcs_info_msg_0_} '

export RPS1='$(git_super_status)'

if [[ -n $SSH_CONNECTION ]]; then
	export PS1="[$(username) @ $(machine_name)] $(directory_name)>"
else
	export PS1="[$(username)] $(directory_name)>"
fi
