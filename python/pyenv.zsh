# Check if pyenv is installed
if which pyenv > /dev/null; then
  # Set the pyenv root directory
  export PYENV_ROOT="$HOME/.pyenv"
  
  # Add pyenv to the PATH if it's not already there
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  
  # Initialize pyenv
  eval "$(pyenv init -)"
  
  # Set the default Python version to 3.11 and print the Python version
  pyenv shell 3.11 && python --version
fi
