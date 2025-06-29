# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glm='git log --first-parent --pretty=format:"%h %ad | %s%d [%an]" --date=short'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git checkout'
alias gca='git commit -a'
alias gs='git status -sb'
alias gsu='git submodule update --init --recursive'
alias gclean='git reset && git clean -f && git checkout .'
alias grc='git rebase --continue'

function gcleanw() {
  # Remove non-critical branches from workspace
  #
  # List all local branches, exclude HEAD, and filter out protected branches
  git branch | grep -v "HEAD" | grep -vE 'main|master|uat|dev|staging|qa' | while read -r branch; do
    # Remove leading/trailing whitespace and delete the branch
    branch=$(echo "$branch" | xargs)
    git branch -D "$branch"
  done
}

# from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
#
# Will return the current branch name
# Usage example: git pull origin $(current-branch)
#
function current-branch() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo ${ref#refs/heads/}
}

function current-repository() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo $(git remote -v | cut -d':' -f 2)
}

function git-branches() {
  git branch --sort=-committerdate
}

function git-rename() {
  git branch -m $1
}

function git-reset-local() {
  git fetch
  git reset --hard @{upstream}
}

function git-changes() {
  git log --stat --follow $1
}

# these aliases take advantage of the previous function
alias gp='git pull origin $(current-branch)'
alias gpr='git pull --rebase origin $(current-branch)'
alias gprp='git pull --rebase origin $(current-branch) && git push origin $(current-branch)'
alias gpush='git push origin $(current-branch)'
alias rebuild='git commit --allow-empty -m "ci: force rebuild" && git push'