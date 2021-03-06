alias reload!='. ~/.zshrc'
alias dir='ls -lFhG'
alias grep='grep --color '
alias diff='diff -r --exclude=.svn'
alias getwell='xattr -d com.apple.quarantine'

# Remove the hosts that I don't want to keep around- in this case, only
# keep the first host. Like a boss.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias gs='git status '
