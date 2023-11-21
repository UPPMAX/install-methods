#!/bin/bash 

mkdir -p bin

if [ -z "${aptPACKAGES}" ]; then
  echo "\$aptPACKAGES not defined"; exit
else
  for ip in $aptPACKAGES; do

  bins=$(dpkg -L $ip  | grep /bin/)
  for i in $bins; do
    echo $i
    ln -sf ../${SINGULARITY_NAME} bin/${i##*/}
  done
done

ln -sf ../${SINGULARITY_NAME} bin/STAR
ln -sf ../${SINGULARITY_NAME} bin/STARlong
ln -sf ../${SINGULARITY_NAME} bin/macs3 

fi
