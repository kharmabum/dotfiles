# Set AWS_PROFILE by reading ~/.aws/profile
export AWS_PROFILE=$( cat ~/.aws/profile )

# Create a new function to write to that script
function aws_profile() {
  # Check what we selected against the list of profiles aws_vault knows about
  grep -q "$1" <( aws-vault list --profiles ) \
    && echo $1 > ~/.aws/profile \
    || echo "aws-vault doesn't know about $1"
  export AWS_PROFILE="$( cat ~/.aws/profile )"
}
