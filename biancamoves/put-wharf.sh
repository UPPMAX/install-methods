#!/bin/bash
me=$(whoami)
proj=$(echo $HOSTNAME | awk -F"-" '{print $1}')
cp -av ${*:-*} /proj/$proj/nobackup/wharf/$me/$me-$proj/
