#!/bin/bash
#get-bianca.sh
usage="$(basename "$0") [-h] [-u USERNAME on bianca] -p PROJECT_NAME <files_to_transfer>"
while getopts ":hu:p:" option
do
    case $option in
        h) echo "$usage"
            exit 0
            ;;
        u) USER="$OPTARG"
            ;;
        p) PRO="$OPTARG"
            ;;
        :) printf "missing argument for -%s\n" "$OPTARG" >&2
            echo "$usage"
            exit 1
            ;;
        \?) printf "illegal option -%s\n" "$OPTARG" >&2
            echo "$usage"
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

me=${USER:-$(whoami)}
proj=${PRO:-sens2016001}
FILE=${*:-*}
sftp -r $me-$proj@bianca-sftp.uppmax.uu.se<<EOF
cd $me-$proj/
get $FILE
quit
EOF
