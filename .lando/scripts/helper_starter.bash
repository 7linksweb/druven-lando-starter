#!/bin/bash

# Expressions for Yes/No questions
export YESEXPR="^[+1sSyY]";
export NOEXPR="^[-0nN]";
export YESWORD="Yes";
export NOWORD="No";

export BR=`echo $'\n.'`; # @todo fix shellcheck(SC2006) shellcheck(SC2155)
export BR=${BR%.}

# Step message function
function echo_step() {
  echo " ";
  echo "=======================================================================";
  echo "==> Running: $1";
  echo "=======================================================================";
}
# @improve create a echo_msg
# @improve create a echo_erro (colored)
# @improve create a echo_warning (colored)
