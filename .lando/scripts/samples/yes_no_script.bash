#!/bin/bash

source "$(dirname "$0")"/helper_starter.bash;

# Commands to execute after 'yes' answer
function commands_to_execute() {
  echo_step "$(basename "$0")";
}

# Execute when you want execute directly with $command -y
if [[ "$1" == -y ]]; then
  commands_to_execute;
  exit;
fi

# Question
while true; do
  read -p "Are you sure you want to execute: \"$(basename "$0")\"? [${YESWORD}/${NOWORD}]? (default: Yes) " yn

  # Set default Yes when answer is missing
  if [ -z "$yn" ]; then
      yn="Y"
  fi

  if [[ "$yn" =~ $YESEXPR ]]; then
    commands_to_execute;
  fi
  # Do NOT
  if [[ "$yn" =~ $NOEXPR ]]; then
    echo "Aborting";
  fi
  exit;
done
