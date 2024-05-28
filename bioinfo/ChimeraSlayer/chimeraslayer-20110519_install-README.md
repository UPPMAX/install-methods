ChimeraSlayer/20110519
======================

LOG
---

    TOOL=/sw/apps/bioinfo/ChimeraSlayer
    VERSION=20110519
    CLUSTER=rackham
    OTHERCLUSTERS="bianca irma"
    mkdir -p $TOOL/{$VERSION,src}
    cd $TOOL/src
    wget https://netcologne.dl.sourceforge.net/project/microbiomeutil/microbiomeutil-r20110519.tgz
    tar xf microbiomeutil-r20110519.tgz
    cd microbiomeutil-r20110519
    module load bioinfo-tools blast/2.2.22 cdbfasta
    make
    make test
    grep -lir '/usr/local/bin/perl' | while read file; do sed -i 's!/usr/local/bin/perl!/usr/bin/env perl!g' "$file" | head -1; done
    cd ..
    mv microbiomeutil-r20110519 $TOOL/$VERSION/$CLUSTER
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod g+rwx $TOOL/$VERSION
