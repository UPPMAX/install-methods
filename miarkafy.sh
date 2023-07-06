#!/bin/bash

shopt -s nullglob

SCRIPT=${0##*/}

Module=${PWD##*/}

[[ $# == 1 ]] || { echo "Usage:   ${SCRIPT}  VERSION      For module $Module version VERSION, shift irma to miarka. Must be located within \$TOOLDIR of a module" ; exit 1; }

VERSION=$1

source $HOME/github-sync/local/install-methods/uppmax_functions.sh

runit() {
    local cmd="$@"; shift;
    echo "$cmd"
    eval "$cmd"
}

[[ -d $VERSION ]] || { echo "No subdirectory for version $VERSION" ; exit 1; }

# rename symlink
( cd $VERSION; echo "$Module  $VERSION/  ..."
  [[ -e irma ]] || { echo "Within $VERSION, 'irma' is not found"; exit 1; }
  [[ -L irma ]] || { echo "Within $VERSION, 'irma' is not a symlink"; exit 1; }
  runit mv irma miarka
)

# modify yaml files
YAML=(*$VERSION.yaml *$VERSION.yamlTEST *$VERSION.DRAFT.yaml *$VERSION.DRAFT.yamlTEST)

[[ ${#YAML[@]} != 0 ]] || { echo "no YAML files found for module $Module version $VERSION"; exit 1; }

for Y in "${YAML[@]}" ; do
    runit sed -i "'s/\<irma\>/miarka/'" "$Y"
done

all_mflink -f $Module $VERSION

