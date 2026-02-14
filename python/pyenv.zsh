# Python environment setup (guarded).
# Set the pyenv root directory
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"                                                                                

# Check if pyenv is installed
if command -v pyenv >/dev/null 2>&1; then
  # Initialize pyenv with shims
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"

  # Set the default Python version to 3.11 and print the Python version
  pyenv shell 3.11
  if command -v python >/dev/null 2>&1; then
    python --version
  fi
fi

# Adds user's base binary directory to path
# https://pipenv.pypa.io/en/latest/install/#pragmatic-installation-of-pipenv
if command -v python >/dev/null 2>&1; then
  export PATH="$(python -m site --user-base)/bin:$PATH"
fi
