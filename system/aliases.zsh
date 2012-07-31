# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias dir='ls -lFhG'
alias grep='grep --color '
alias diff='diff -r --exclude=.svn'
alias getwell='xattr -d com.apple.quarantine'