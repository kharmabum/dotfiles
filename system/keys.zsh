# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias addkey="ssh-add -K ~/.ssh/id_rsa"