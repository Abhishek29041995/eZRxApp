#!/bin/bash

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'

get_commit_branch() {
# Get the commit branch from the CI_BRANCH_NAME environment variable if it exists
  if [ -n "$CI_BRANCH_NAME" ]; then
    echo "$CI_BRANCH_NAME"
    return;
  fi

  local commitBranchFile=".git/HEAD"
  if [  -e "$commitBranchFile"  ]; then
    local rawCommitBranch=$(cat "$commitBranchFile")
    # commitBranch on local we retrieve ref: refs/heads/branch-name 
    # CI Branch we retrieve refs/heads/branch-name, so we need to subString the ref: for consistent
    rawCommitBranch=$(echo $rawCommitBranch | awk '{ print substr( $0, 6, length($0)-6 ) }')
    echo "$rawCommitBranch"
  fi
}

is_valid_branch_name() {
  local commitBranch="$1"
  echo "$commitBranch"
  local pattern="^(refs\/heads\/(ref|feat|fix|tdd|hotfix|chore|testcase)\/(EZRX|RXUAT)-[0-9]+-([0-9a-zA-Z._-]{10,})+$)"
  [[ $commitBranch =~ $pattern ]]
}

commitBranch=$(get_commit_branch)

if ! is_valid_branch_name "$commitBranch"; then
  echo "${RED}👎 Auron is not happy with your branch name. 
   ${RED} You should rename your branch to a valid name and try again. 
   ${RED} Please check https://zuelligpharma.atlassian.net/wiki/spaces/EZRX/pages/133890113/Branch+Naming+Conventions for more details"
  exit 1
fi

echo "${GREEN}👍 Valid branch name!"
exit 0
