#!/bin/bash

# together with miarkafy.sh, resets links within $VERSIONDIR of a module to remove milou

shopt -s nullglob

SCRIPT=${0##*/}

Module=${PWD##*/}

[[ $# == 1 ]] || { echo "Usage:   ${SCRIPT}  VERSION      Move milou/ to rackham/ and resettle links, including miarka. Follow with miarkafy.sh VERSION. Must be located within \$TOOLDIR of a module" ; exit 1; }

VERSION=$1

source $HOME/github-sync/local/install-methods/uppmax_functions.sh

runit() {
    local cmd="$@"; shift;
    echo "$cmd"
    eval "$cmd"
}

[[ -d $VERSION ]] || { echo "No subdirectory for version $VERSION" ; exit 1; }

# mv milou to rackham and reset links
( cd $VERSION; echo "demilou-ing  $Module  $VERSION/  ..."
  [[ -d milou ]] || { echo "Within $VERSION, 'milou' is not a directory"; exit 1; }
  rm -f rackham bianca irma snowy
  mv milou rackham
  for C in bianca irma snowy ; do
    ln -sf rackham $C
  done
)

