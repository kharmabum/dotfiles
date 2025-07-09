alias simple='python3 -m http.server'
alias vcreate='python -m venv venv'

function activate() {
  if [ -d .venv ]; then
    echo "Activating .venv..."
    if [ -f .venv/bin/activate ]; then
      source .venv/bin/activate
    else
      echo "Error: .venv exists but bin/activate is missing." >&2
      return 1
    fi
  elif [ -d venv ]; then
    echo "Activating venv..."
    if [ -f venv/bin/activate ]; then
      source venv/bin/activate
    else
      echo "Error: venv exists but bin/activate is missing." >&2
      return 1
    fi
  else
    echo "Error: No virtual environment directory found (.venv or venv)." >&2
    return 1
  fi
}

# Function to create and activate a Python virtual environment
# Example usage: create_venv [python_version]
# e.g., create_venv 3.11
function create-venv() {
    
    local python_version="${1:-3.11}"  # Default to Python 3.11 if not specified

    # Check if pyenv is installed
    if ! command -v pyenv &> /dev/null; then
        echo "Error: pyenv is not installed. Please install pyenv first."
        return 1
    fi

    # Set Python version using pyenv
    echo "Setting Python version to $python_version..."
    pyenv shell "$python_version" || {
        echo "Error: Failed to set Python version $python_version. Is it installed in pyenv?"
        return 1
    }

    # If venv exists, rename it to venv-old
    if [ -d "venv" ]; then
        echo "Existing venv found. Renaming to venv-old..."
        rm -rf venv-old 2>/dev/null  # Remove old backup if it exists
        mv venv venv-old || {
            echo "Error: Failed to rename venv to venv-old."
            return 1
        }
    fi

    # Create new virtual environment
    echo "Creating new virtual environment..."
    python -m venv venv || {
        echo "Error: Failed to create virtual environment."
        return 1
    }

    # Activate the virtual environment
    echo "Activating virtual environment..."
    source venv/bin/activate || {
        echo "Error: Failed to activate virtual environment."
        return 1
    }

    # Install requirements if requirements.txt exists
    if [ -f "requirements.txt" ]; then
        echo "Installing dependencies from requirements.txt..."
        pip install -r requirements.txt || {
            echo "Error: Failed to install dependencies."
            deactivate
            return 1
        }
    else
        echo "No requirements.txt found. Skipping dependency installation."
    fi

    echo "Virtual environment setup complete. Python version: $(python --version)"
}