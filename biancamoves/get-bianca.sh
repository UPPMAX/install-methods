#!/bin/bash
#get-bianca.sh
FILE=${*:-*} 
sftp -r jonass-sens2016001@bianca-sftp.uppmax.uu.se<<EOF
cd jonass-sens2016001/
get $FILE
quit
EOF
