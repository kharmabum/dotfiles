
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jfoust/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jfoust/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jfoust/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jfoust/google-cloud-sdk/completion.bash.inc'; fi



alias diglett-pg='cloud-sql-proxy diglett-a98cc:us-west1:diglett --port 6666'

export CLOUDSDK_PYTHON=$(pyenv prefix 3.11)/bin/python