# Set AWS_PROFILE by reading ~/.aws/profile
export AWS_PROFILE=$( cat ~/.aws/profile )

# Create a new function to write to that script
function aws-profile() {
  # Check what we selected against the list of profiles aws_vault knows about
  grep -q "$1" <( aws-vault list --profiles ) \
    && echo $1 > ~/.aws/profile \
    || echo "aws-vault doesn't know about $1"
  export AWS_PROFILE="$( cat ~/.aws/profile )"
}

# Add autocompletion to the aws_profile command:
# first, initialize autocomplete (libraries like oh-my-zsh do this automatically):
autoload -Uz compinit
compinit
# then, define a function which returns a list of the avaialable profiles:
function _aws_profile {
  compadd `aws-vault list --profiles | tr '\n' ' '`
}
# ..then tell zsh to use this function for autocomplete for the aws_profile function:
compdef _aws_profile aws_profile