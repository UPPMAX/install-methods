GeneMark/4.38-es
================

<http://exon.biology.gatech.edu/GeneMark/gmes_instructions.html>

LOG
---

    cd /sw/apps/bioinfo/GeneMark/
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
