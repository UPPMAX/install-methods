REPET/2.5
=========

<https://urgi.versailles.inra.fr/Tools/REPET>

Installation directions in <https://urgi.versailles.inra.fr/Tools/REPET/INSTALL>


LOG
---

    cd /sw/bioinfo
    mkdir REPET
    VERSION=2.5
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    VERSIONDIR=$PWD
    PFX=$VERSIONDIR/$CLUSTER
    for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done

Don't make `$CLUSTER` because the unpacked RepeatMasker directory will become that

    mkdir src
    cd src
    wget https://urgi.versailles.inra.fr/download/repet/REPET_linux-x64-${VERSION}.tar.gz
    tar xzf REPET_linux-x64-${VERSION}.tar.gz

Installation directions in
<https://urgi.versailles.inra.fr/Tools/REPET/INSTALL>.  Several prerequisites,
including MySQL (we'll use MariaDB) and python packages MySQLdb, logging, yaml.
It also needs, specifically, the MyISAM database engine to be used.  For
MariaDB, the default is InnoDB.  I have created

    export MYSQL_HOME=$VERSIONDIR/aux/MariaDB
    mkdir $MYSQL_HOME
    cd $MYSQL_HOME

and then created `my.cnf` in inthis directory, containing the three lines

    [server]
    skip-innodb
    default-storage-engine=myisam

and make sure `MYSQL_HOME` is defined as above. Then, dl `ml MariaDB/10.1.29`
and then `mysqld --help --verbose`.  You should now see

    rackham5: /sw/bioinfo/REPET/2.5 $ mysqld --help --verbose
    2019-01-28 15:52:14 47881717601792 [Note] Plugin 'InnoDB' is disabled.
    2019-01-28 15:52:14 47881717601792 [Note] Plugin 'FEEDBACK' is disabled.
    2019-01-28 15:52:14 47881717601792 [Warning] Could not open mysql.plugin table. Some options may be missing from the help text
    mysqld  Ver 10.1.29-MariaDB for Linux on x86_64 (Source distribution)
    Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

    Starts the MariaDB database server.

    Usage: mysqld [OPTIONS]

    Default options are read from the following files in the given order:
    /etc/my.cnf /etc/mysql/my.cnf /sw/bioinfo/REPET/2.5/aux/MariaDB/my.cnf ~/.my.cnf
    The following groups are read: mysqld server mysqld-10.1 mariadb mariadb-10.1 client-server galera

    ...

    default-storage-engine                                     myisam

    ...

Hopefully this is enough, since there is no persistent MariaDB running.  Make
sure to define `MYSQL_HOME` in the mf file for REPET.

Note that we are loading the slightly older `MariaDB/10.1.29`, *not*
`MariaDB/10.2.11`.  Otherwise there will be a compile error about a missing
`reconnect` method when installing the MySQL-python package:

    _mysql.c: In function '_mysql_ConnectionObject_ping':
    _mysql.c:2005:41: error: 'MYSQL' has no member named 'reconnect'
      if ( reconnect != -1 ) self->connection.reconnect = reconnect;
                                             ^
So now install the python packages we need.

    cd $PFX
    mkdir python-packages
    PUB=$PFX/python-packages
    PYTHONUSERBASE=$PUB pip install --user MySQL-python logging pyyaml

Make sure to add to `PYTHONPATH`:
`$modroot/python-packages/lib/python2.7/site-packages` in the mf file.


Queueing system
---------------

We don't have SGE or TORQUE, so I dunno what to do about queueing.  Hopefully
REPET has a local mode.


Blast+, RECON, PILER
-------------------

Older Blast+, like 2.2.31+.  Load:

    module load blast/2.2.31+

RECON is available over under RepeatMasker.  Add to `PATH`:

    /sw/bioinfo/RepeatMasker/aux_rackham/RECON/1.08/bin
    /sw/bioinfo/RepeatMasker/aux_rackham/RECON/1.08/scripts


RepBase REPET version
---------------------

.  Download on office mac, rsync to rackham.

    REPBASE_VERSION=20.05_REPET
    rsync -Pt douglasscofield@fb166.ebc.uu.se:Downloads/RepBase${REPBASE_VERSION}.embl.tar.gz .
    tar xzf RepBase${REPBASE_VERSION}.embl.tar.gz


Auxiliary programs
------------------


Several suggested auxiliary programs are already in place from the installation of
RepeatMasker/4.0.8 and are found under:

    /sw/bioinfo/RepeatMasker/aux_rackham/

I am renaming the now-obsolete `/sw/bioinfo/RepeatMasker/aux/` to `aux_milou`,
but leaving it in place for legacy reasons.

TRF, Tandem Repeat Finder version 4.09 for 64-bit linux (<https://tandem.bu.edu/trf/trf.html>)

    /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.0.9/trf

RMBlastn 2.6.0+ is the latest version of RMBlastn.  Use the one in
`aux_rackham` built for RepeatMasker/4.0.7.

    cd /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/
    RMBLAST_VERSION=2.6.0+
    cd $RMBLAST_VERSION
    RMB_PREFIX=$PWD

nseg, not actually needed here but for RepeatModeler (<http://www.repeatmasker.org/RepeatModeler.html>) (quite old, from <ftp://ftp.ncbi.nih.gov/pub/seg/nseg/>).

    /sw/bioinfo/RepeatMasker/aux_rackham/nseg/{nseg,nmerge}

cross_match:

    /sw/bioinfo/RepeatMasker/aux_rackham/cross_match_src/cross_match

Now create `$CLUSTER` from the RepeatMasker directory and configure it with the
available sequence tools.  Note that it wants directories in which the tools can
be found, not direct paths to the tools.

    cd /sw/bioinfo/RepeatMasker/$VERSION
    mv src/RepeatMasker $CLUSTER
    cd $CLUSTER/
    module load perl/5.26.2 perl_modules/5.26.2
    which perl
    ./configure 

Make it use the `env` method to find perl.  The default sequence search method
should be rmblastn.

Directory for TRF:

    /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.09

Directory for cross_match:

    /sw/bioinfo/RepeatMasker/aux_rackham/cross_match_src

Directory for RMBlast:

    /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/2.6.0+/bin

and Y to make RMBlast the default.

Directory for HMMER3.1b2:

    /sw/bioinfo/hmmer/3.1b2/rackham/bin


Check the configuration, see if anything might be missed.

    diff -W $COLUMNS -y RepeatMaskerConfig.tmpl RepeatMaskerConfig.pm | less

And check the tree to see if anything else might need to have `#!` line fixed.
Note that module files (`*.pm`) do not need that fixed.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env'

There were several in the `util/` directory.

The mf from 4.0.7 is a start, but we need to load `perl/5.26.2` and `perl_modules/5.26.2`.

