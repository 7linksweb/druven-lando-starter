#!/bin/bash

source "$(dirname "$0")"/helper_starter.bash;

echo_step "Starting the creation of a new druven lando project.";

# Create a new ../.lando.base.yml file base on ../resources/.lando.base.yml
cp ../resources/.lando.base.yml ../.lando.base.yml

# @todo: Validate project name input
read -p "Enter the new project name (ex: druven_lando-starter10): $BR" project
sed -i "s/{DRUVEN-LANDO-STARTER}/$project/g" ../.lando.base.yml;

# @improve Add php version selection
# @improve Add mariadb version selection
# @improve Add phpmyadmin feature (enabled, disabled, none)