alias cl="clear"
alias ..='cd ..'

alias l='ls -lAh'         # Lists in one column, hidden files.
alias l.="ls -d .*"
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias l="gls -lAh --color"
  alias la="gls -A --color"
  alias ll="gls -lh --color"
  alias ls="gls -F --color"
fi

alias t="tree -lR -L 3"
alias td="tree -lR -L 3 -d"


# taken from @paulmllr dotfiles

# Useful global aliases.
alias -g 'H'='| head'     # git log H
alias -g 'T'='| tail'     # git log T
alias -g 'F'='| head -n'  # git log F 15
alias -g 'L'='| tail -n'  # git log L 10
alias -g 'C'='| wc -l'    # git log C

alias wget='wget --no-check-certificate'

# Some OS X-only stuff.
if [[ "$OSTYPE" == darwin* ]]; then
  # Short-cuts for copy-paste.
  alias c='pbcopy'
  alias p='pbpaste'

  # Remove all items safely, to Trash (`brew install trash`).
  alias rm='trash'

  # Case-insensitive pgrep that outputs full path.
  alias pgrep='pgrep -fli'

  # Lock current session and proceed to the login screen.
  alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

  # Sniff network info.
  alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

  # Gets password from OS X Keychain.
  # $ get-pass github
  function get-pass() {
    keychain="$HOME/Library/Keychains/login.keychain"
    security -q find-generic-password -g -l $@ $keychain 2>&1 |\
      awk -F\" '/password:/ {print $2}';
  }
fi


alias du-disk='du -a / | sort -n -r | head -n 5'

function ssh-pbcopy() {
  ssh -e none $1 "cat $2" | pbcopy
}

alias isodate='date +%Y-%m-%dT%H:%M:%S%z'
alias tsdate='date +%s'

# Mount
function mount_list() {
  mount -v | grep "^/" | awk '{print "\nPartition identifier: " $1 "\n Mountpoint: "  $3}'
}
