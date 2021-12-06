alias simple='python3 -m http.server'

#################################################################
# Black
#################################################################

alias black="black --config pyproject.toml"

#################################################################
# Flake8
#################################################################

alias flake8="flake8 --config .flake8"

#################################################################
# Conda
#################################################################


alias conda-kill="pkill -f conda_packaging_tool.py"

conda-create() {
  conda create --name $1 python=$2
}

conda-list() {
  conda env list
}