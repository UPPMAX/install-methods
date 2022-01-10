tRNAscan-SE/2.0.9
========================

<http://lowelab.ucsc.edu/tRNAscan-SE/>

Used under license:
GPLv3


Structure creating script (makeroom_tRNAscan-SE_2.0.9.sh) moved to /sw/bioinfo/tRNAscan-SE/makeroom_2.0.9.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "tRNAscan-SE" -v "2.0.9" -w "http://lowelab.ucsc.edu/tRNAscan-SE/" -d "Improved Detection and Functional Classification of Transfer RNA Genes" -l "GPLv3"
    ./makeroom_tRNAscan-SE_2.0.9.sh
tRNAscan-SE/1.3.1
=================

<http://eddylab.org/software.html>

<http://lowelab.ucsc.edu/tRNAscan-SE/help.html>


Wes had downloaded a tarball for 1.3.1 a while ago.  My goal is to understand
what he did and do it for rackham.  The main change is to the Makefile from the
tarball, which work once `PREFIX` is defined and exported.  After that it is
simply `make` and `make install`.

There is a new version of tRNAscan-SE coming
(<http://lowelab.ucsc.edu/tRNAscan-SE/help.html>) but the download is not yet
available for that.


LOG
---

    cd /sw/apps/bioinfo/tRNAscan-SE
    VERSION=1.3.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd $VERSION
    mkdir -p $CLUSTER
    cd $CLUSTER
    export PREFIX=$PWD
    cd ../src
    tar xzf Lowe-tRNAscan-SE.tar.gz
    mv tRNAscan-SE-1.3.1 tRNAscan-SE-1.3.1_$CLUSTER
    cd tRNAscan-SE-1.3.1_$CLUSTER

Modify the Makefile:

    vi Makefile

The changes to the Makefile are:

    $ diff tRNAscan-SE-1.3.1/Makefile tRNAscan-SE-1.3.1_milou/Makefile
    23,25c23,25
    < BINDIR  = $(HOME)/bin
    < LIBDIR  = $(HOME)/lib/tRNAscan-SE
    < MANDIR  = $(HOME)/man
    ---
    > BINDIR  = $(PREFIX)/bin
    > LIBDIR  = $(PREFIX)/lib/tRNAscan-SE
    > MANDIR  = $(PREFIX)/man
    33c33
    < TEMPDIR = /tmp
    ---
    > TEMPDIR = /scratch

The use of a hardcoded `TEMPDIR` are mitigated by the fact that if `TMPDIR` is
set (and it is, by SLURM to `SNIC_TMP`), it doesn't matter.

With newer gcc, like the default on rackham, there are some warnings during
compilation about assumption of `int` being the return type.  Seems like an
assumption holding over from the K&R days :-)

    make
    make install

Also, check `#!` in the installed file `tRNAscan-SE`.  It may need to be changed
to `#!/usr/bin/env perl`.
