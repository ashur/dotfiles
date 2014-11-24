# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle ruby
antigen bundle sudo
antigen bundle svn-fast-info

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then

    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
		
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

fi

