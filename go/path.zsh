[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Check if gvm is installed
if which gvm > /dev/null; then
  gvm use go1.21 --default
  go version
fi
