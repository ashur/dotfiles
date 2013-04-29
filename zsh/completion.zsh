autoload -U compinit && compinit                                                                                       
zmodload -i zsh/complist

fpath=(
	$ZSH/zsh/functions 
	$fpath)

autoload -U $ZSH/zsh/functions/*(:t)

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
