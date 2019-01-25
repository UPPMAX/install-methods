samstat/1.5.1
=============

This tool is a bit old, 3 years.  It needs `samtools` available in the `PATH`
so will load samtools/1.8 by default, if a version of samtools is not already
loaded.

LOG
---

    cd /sw/apps/bioinfo
    mkdir samstat
    cd samstat
    VERSION=1.5.1
    mkdir $VERSION
    mkdir mf
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://netix.dl.sourceforge.net/project/samstat/samstat-${VERSION}.tar.gz
    tar xzf samstat-${VERSION}.tar.gz
    cd samstat-${VERSION}
    module load bioinfo-tools samtools/1.8  # only needed for ./configure
    ./configure --prefix=$PFX
    make
    make install

In the mf file, make sure to load samtools if one is not loaded, and include a
message about it in the help.
