#!/bin/bash

source "$(dirname "$0")"/helper_starter.bash || exit;

echo_step "Starting the creation of a new druven lando project.";

echo_msg "Create a new ./.lando.base.yml file base on ../resources/.lando.base.yml";
cp ../resources/.lando.base.yml ../../.lando.base.yml || exit;

# @todo: Validate project name input
read -p "Enter the new project name (ex: druven_lando-starter10): $BR" project
sed -i "s/{DRUVEN-LANDO-STARTER}/$project/g" ../../.lando.base.yml || exit;

# Question
while true; do
  read -p "Would you like to run the 'lando start' command? [${YESWORD} / ${NOWORD}]? " yn

  # Check if the variable is empty or undefined
  if [ -z "$yn" ]; then
      yn="Y"
  fi

  if [[ "$yn" =~ $YESEXPR ]]; then
    echo_msg "Starting 'lando stat' command";
    lando start;
  fi
  # Do NOT
  if [[ "$yn" =~ $NOEXPR ]]; then
    echo "You can run the 'lando start' command whenever you want.";
  fi
  exit;
done

echo_msg "Removing create-druven-project.bash launch script";
rm -fr ../../create-druven-project.bash || exit;

echo_msg "Done!";


# @improve Add php version selection
# @improve Add mariadb version selection
# @improve Add phpmyadmin feature (enabled, disabled, none)
