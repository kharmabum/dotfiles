# Adds user's base binary directory to path
# https://pipenv.pypa.io/en/latest/install/#pragmatic-installation-of-pipenv
export PATH="$(python -m site --user-base)/bin:$PATH"