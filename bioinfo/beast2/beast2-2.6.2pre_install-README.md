beast2/2.6.2pre
===============

<https://github.com/CompEvol/beast2>

Used under license:
LGPL v2.1

Structure creating script (makeroom_beast2_2.6.2pre.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/beast2/makeroom_2.6.2pre.sh

Downloading the 2.6.1 package got only java jars, so get 2.6.2pre in preference to 2.6.0.
Replace the `$PREFIX` with the unpacked package directory.

LOG
---

    cd /sw/bioinfo/beast2
    makeroom.sh -f -t beast2 -s phylogeny -v 2.6.2pre -w https://github.com/CompEvol/beast2 -d "Bayesian Evolutionary Analysis by Sampling Trees" -l "LGPL v2.1"
    ./makeroom_beast2_2.6.2pre.sh 
    source SOURCEME_beast2_2.6.2pre
    cd 2.6.2pre/
    cd src/
    wget https://github.com/CompEvol/beast2/releases/download/v2.6.2pre/BEAST.v2.6.2pre.tgz
    tar xzf BEAST.v2.6.2pre.tgz 
    rmdir $PREFIX
    mv beast $PREFIX

Use the 2.4.8 mf file, but add `BEAST2_ROOT` variable.
