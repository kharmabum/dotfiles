# Set the pyenv root directory
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"                                                                                

# Check if pyenv is installed
if which pyenv > /dev/null; then
  # Initialize pyenv with shims
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"

  # Set the default Python version to 3.11 and print the Python version
  pyenv shell 3.11
  python --version
fi

# Adds user's base binary directory to path
# https://pipenv.pypa.io/en/latest/install/#pragmatic-installation-of-pipenv
export PATH="$(python -m site --user-base)/bin:$PATH"