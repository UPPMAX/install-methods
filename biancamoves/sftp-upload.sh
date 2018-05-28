#!/bin/bash
#sftp-upload.sh
#echo $* | tr " " "\n" | awk -F"[/ ]" '{str = ""; for (i = 1; i <= NF; i++) { str=str $i "/"; print "mkdir " str;}}'
find $* -type d | awk '{print "mkdir",$0}' 
find $* -type f | awk '{print "put",$0,$0}' 
find $* -type l | awk '{print "put",$0,$0}' 
