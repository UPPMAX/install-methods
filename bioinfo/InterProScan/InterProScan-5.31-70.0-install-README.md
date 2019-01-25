InterProScan/5.31-70.0
======================

<https://www.ebi.ac.uk/interpro/search/sequence-search>

LOG
---

Set up the install directories and variables.

One change from earlier versions is that the panther databases are now under
`/sw/data/uppnex/panther`, and we modify the `interproscan.properties` file to
point to the correct version, rather than 'faking it' with a symlink.

    TOOLDIR=/sw/apps/bioinfo/InterProScan
    mkdir -p $TOOLDIR
    cd $TOOLDIR

    VERSION=5.31-70.0

    VERSIONDIR=$TOOLDIR/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    
    SRCDIR=$VERSIONDIR/src
    mkdir -p $SRCDIR

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    # do not create clusterdir, the unpacked InterProScan directory becomes that

Get software and data, 64-bit version link from http://www.ebi.ac.uk/interpro/download.html.

    cd $SRCDIR

    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz.md5
    md5sum -c interproscan-${VERSION}-64-bit.tar.gz.md5
    tar xzf interproscan-${VERSION}-64-bit.tar.gz
    mv -v interproscan-${VERSION} $CLUSTERDIR

Panther dataset
---------------

Get the PANTHER 12.0 data and install it.  InterProScan 5.30 uses Panther 12.0.
We put all Panther datasets in `$PANTHERDIR`.

    PANTHERVERSION=12.0
    PANTHERROOT=/sw/data/uppnex/panther
    mkdir -p $PANTHERROOT
    PANTHERSRC=$PANTHERROOT/src
    mkdir -p $PANTHERSRC
    PANTHERDIR=$PANTHERROOT/$PANTHERVERSION

    cd $PANTHERSRC
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz.md5
    md5sum -c panther-data-${PANTHERVERSION}.tar.gz.md5 || echo "*** MD5 check failed"
    tar xzf panther-data-${PANTHERVERSION}.tar.gz
    cd panther
    mv $PANTHERVERSION ../..
    cd ..
    rmdir panther

Now to update the InterProScan `interproscan.properties` file to point here.

    cd $CLUSTERDIR
    vi interproscan.properties

Within this file, I editted the panther lines to be:

    #PANTHER
    panther.temporary.file.directory=
    panther.models.dir=/sw/data/uppnex/panther/12.0/
    panther.hmm.path=/sw/data/uppnex/panther/12.0/panther.hmm
    panther.names.tab=/sw/data/uppnex/panther/12.0/names.tab

The `panther.models.dir` property was not there previously, but I added it as
per the instructions at
<https://github.com/ebi-pf-team/interproscan/wiki/HowToDownload> for installing
panther in a different location.  Those instructions do not include the
`panther.names.tab` property so I think completeness is best, until proven wrong.


Java, Python 3 and Perl 5
-------------------------

Following
<https://github.com/ebi-pf-team/interproscan/wiki/InstallationRequirements>, a
Python 3 must be available as well as any Perl 5, and Oracle's JDK/JRE 8 or
higher, with `$JAVA_HOME` holding the location of the JVM and `$JAVA_HOME/bin`
in `PATH`.  So, we should load one of the Java 8 modules, since both these will
be true after that module load.  In the mf file, we'll add:

    module load java/sun_jdk1.8.0_151

As of this installation, after loading we get:

    rackham5$ java -version
    java version "1.8.0_151"
    Java(TM) SE Runtime Environment (build 1.8.0_151-b12)
    Java HotSpot(TM) 64-Bit Server VM (build 25.151-b12, mixed mode)

For Python 3 and Perl 5, it claims to need any `python3` and `perl` to be
available in the path, with no special packages.  Suitable versions should be
available on the system.  As of this installation:

    rackham5$ python3 --version
    Python 3.4.9
    rackham5$ perl --version

    This is perl 5, version 16, subversion 3 (v5.16.3) built for x86_64-linux-thread-multi
    (with 33 registered patches, see perl -V for more detail)

    ...


Activating separately licenced analyses
---------------------------------------

There are several tools not distributed with InterProScan because they have
several licences, see
<https://github.com/ebi-pf-team/interproscan/wiki/ActivatingLicensedAnalyses>.
We make links for tools that are not distributed with InterProScan but we have
locally.

We also do the following module loads, though these are not required to run the
tool because of symlinks added below.

    module load bioinfo-tools
    module load Phobius/1.01
    module load SignalP/4.1f
    module load tmhmm/2.0c

Phobius 1.01 (note module name is capitalised):

    cd $CLUSTERDIR/bin/phobius/1.01/
    ln -s /sw/apps/bioinfo/Phobius/1.01/$CLUSTER/{phobius.pl,decodeanhmm,phobius.model,phobius.options} .

SignalP 4.1f:

    cd $CLUSTERDIR/bin/signalp/4.1/
    ln -s /sw/apps/bioinfo/SignalP/4.1f/$CLUSTER/{signalp,bin} .

TMHMM 2.0c:

    cd $CLUSTERDIR/bin/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/$CLUSTER/bin/decodeanhmm.Linux_x86_64 decodeanhmm
    cd $CLUSTERDIR/data/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/$CLUSTER/lib/TMHMM2.0.model TMHMM2.0c.model

Update groups and permissions.

    cd $TOOLDIR
    fixup -g .

Update the mf file, note the new module loads above.

Afterwards, make sure it works.  It takes several seconds to get going.

    module load bioinfo-tools
    module load InterProScan/5.30-69.0
    interproscan.sh

And then, run the tests.  Because the module is loaded, it is important *not*
to use `./interproscan.sh ...`, but instead `interproscan.sh ...` so everything
is found via `PATH`.  These tests require a few minutes to complete.

    cd $CLUSTERDIR
    interproscan.sh -i test_proteins.fasta -f tsv
    interproscan.sh -i test_proteins.fasta -f tsv -dp

The first test runs full InterProScan, the second avoids the lookup service.
This will result in two files: 

    -rw-rw-r--  1 douglas sw  14352 Sep 17 10:56 test_proteins.fasta.tsv
    -rw-rw-r--  1 douglas sw  14352 Sep 17 11:09 test_proteins.fasta_1.tsv

As you see in my tests these are identical.

