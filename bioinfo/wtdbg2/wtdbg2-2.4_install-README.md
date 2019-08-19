wtdbg2/2.4
==========

<https://github.com/ruanjue/wtdbg2>

Used under license:
GPL v3

Structure creating script (makeroom_wtdbg2_2.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/wtdbg2/makeroom_2.4.sh

LOG
---

    TOOL=wtdbg2
    VERSION=2.4
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_wtdbg2_${VERSION}.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src

    wget https://github.com/ruanjue/wtdbg2/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd wtdbg2-${VERSION}/
    module load gcc/8.3.0
    make -j 4
    make BIN=$PREFIX/bin install
    cp -av scripts $PREFIX/

Now see if the `#!` of any scripts needs to be changed.

    cd $PREFIX/scripts
    head -n 1 *

Yes, many refer to `#!/usr/bin/perl`, so change them.

    sed -i -e 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *
    head -n 1 *
