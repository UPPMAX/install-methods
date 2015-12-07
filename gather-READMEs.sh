#!/bin/bash

set -x
set -e

REPOSITORY='/home/douglas/github-sync/local/uppmax/install-methods'

cd /sw

find apps -name '*install-README.md' | cpio -pdm $REPOSITORY
find libs -name '*install-README.md' | cpio -pdm $REPOSITORY
find comp -name '*install-README.md' | cpio -pdm $REPOSITORY

