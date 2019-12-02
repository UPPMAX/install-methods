GeneMark/4.48-es
================

<http://exon.biology.gatech.edu/GeneMark/gmes_instructions.html>

LOG
---

    cd /sw/bioinfo/GeneMark/
    VERSION=4.38-es
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src

Actual addresses obtained after agreeing to licence.

    wget http://topaz.gatech.edu/GeneMark/tmp/xxxx/gm_et_linux_64.tar.gz
    wget http://topaz.gatech.edu/GeneMark/tmp/xxxx/gm_key_64.gz

    gunzip gm_key_64.gz 
    mv gm_key_64 ..
    tar xzf gm_et_linux_64.tar.gz 
    cd gm_et_linux_64/
    mv gmes_petap ../../$CLUSTER
    cd ../../$CLUSTER

    mv gm_key _gm_key_orig
    cp -av ../gm_key_64 .
    ln -s gm_key_64 gm_key

We can use the mf file from 4.33-es, which gives the user instructions for
copying gm_key in their home directory.  That may not be required given it
lives in the same directory as the rest of the tool.

Also, change the `#!` lines in the perl files to be `#!/usr/bin/env perl`.

    vi *.pl

wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_6Zty6/gm_key_64.gz
gunzip gm_key_64.gz 
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_6Zty6/gm_et_linux_64.tar.gz
tar xzf gm_et_linux_64.tar.gz 

1018  ll
1019  cd gm_et_linux_64/
1020  ll
1021  head -1 *.pl
1022  ll
1023  ./gmhmme3 --version
1024  ./gmhmme3 -h
1025  ./gmhmme3
1026  ./gmhmme3 -v
1027  less gmes.cfg
1028  ll ../..
1029  mv t src
1030  cd ..
1031  mv t src
1032  mkdir 4.48-es
1033  mv src 4.48-es/
1034  ll
1035  cp GeneMark-4.38-es-install-README.md GeneMark-4.48-es_install-README.md
1036  ll
1037  history >> GeneMark-4.48-es_install-README.md
