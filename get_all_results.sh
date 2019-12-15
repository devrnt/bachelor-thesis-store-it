#!/bin/bash
# amount of times the state management should be executed
AMOUNT_OF_RUNS=${1:-30}
# get all the branches as an array
branches=()
eval "$(git for-each-ref --shell --format='branches+=(%(refname))' refs/heads/)"

# loop through the branches
for i in "${!branches[@]}"; do
  # format to only the branch name ("refs/heads/mobx --> mobx")
  branch_name="${branches[$i]/'refs/heads/'/''}"
  # skip the master branch, this branch does not contain state management code
  if [ "${branch_name}" != "master" ]; then
    git checkout ${branch_name}
    # clean build directory
    flutter clean
    # initialize next and next_next index
    next_index=$((i + 1))
    next_next_index=$((i + 2))
    # format next branch to only the branch name ("refs/heads/mobx --> mobx")
    next_branch_name="${branches[$next_index]/'refs/heads/'/''}"
    next_next_branch_name="${branches[$next_next_index]/'refs/heads/'/''}"

    echo "============="
    for ((i = 0; i < AMOUNT_OF_RUNS; i++)); do
      current_run=$((i + 1))
      echo "[${branch_name}] Executing run ${current_run} of ${AMOUNT_OF_RUNS}..."
      # sets the description based on the branch_name
      DESC="${branch_name}" flutter drive --target=test_driver/app.dart --profile
      sleep 1
    done
    echo "============="
    echo "Preparing next branch..."
    git checkout ${next_branch_name}
  else
    git checkout ${next_branch_name}
  fi
done
