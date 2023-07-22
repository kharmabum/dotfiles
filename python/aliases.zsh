alias simple='python3 -m http.server'
alias activate='source .venv/bin/activate'

#################################################################
# Black
#################################################################

#alias black="black --config pyproject.toml"
alias blacks="git status --porcelain | sed s/^...// | xargs -n1 black && flakes"
#################################################################
# Flake8
#################################################################

#alias flake8="flake8 --config .flake8"
alias flakes="git status --porcelain | sed s/^...// | xargs -n1 flake8"

