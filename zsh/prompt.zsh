autoload colors && colors
autoload -Uz vcs_info

setopt prompt_subst

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'



directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(rb_prompt) in $(directory_name) $(git_dirty)$(need_push)\n› '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
	settab
	settitle
  vcs_info
}

export RPS1='${vcs_info_msg_0_} '

if [[ -n $SSH_CONNECTION ]]; then
	export PS1='[%F{red}%n%F{white} @ %F{3}%m%F{white}] %F{green}%~%F{white} >'
else
	export PS1='[%F{red}%n%F{white}] %F{green}%~%F{white} >'
fi
