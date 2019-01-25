
Set up the install directories and variables.

    TOOLDIR=/sw/apps/bioinfo/InterProScan
    mkdir -p $TOOLDIR
    cd $TOOLDIR

    VERSION=5.15-54.0

    PANTHERVERSION=10.0

    VERSIONDIR=$TOOLDIR/$VERSION
    mkdir -p $VERSIONDIR
    
    SRCDIR=$TOOLDIR/src
    mkdir -p $SRCDIR

    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    # do not create clusterdir, the unpacked InterProScan directory becomes that

Get software and data, 64-bit version link from http://www.ebi.ac.uk/interpro/download.html.

    cd $SRCDIR

    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/${VERSION}/interproscan-${VERSION}-64-bit.tar.gz.md5
    md5sum -c interproscan-${VERSION}-64-bit.tar.gz.md5
    tar xzf interproscan-${VERSION}-64-bit.tar.gz
    mv -v interproscan-${VERSION} $CLUSTERDIR

Get the PANTHER 10.0 data and install it.  Note that 5.10, 5.11 and 5.13 use
the same Panther dataset ($TOOLDIR/panther-common), which is 9.0.

    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz.md5
    md5sum -c panther-data-${PANTHERVERSION}.tar.gz.md5
    tar xzf panther-data-${PANTHERVERSION}.tar.gz.md5
    mv -v panther $CLUSTERDIR/data/

Edit by Wes: Moved Panther/10.0 to $TOOLDIR/panther-common and replaced with
link. Did this to be able to use same data with next installation (5.20).
Older InterProScan versions using Panther 9.0 had their sym links adjusted to
point to the 9.0 directly rather than the panther-common folder (created
panther folders in their data folders and made the links there).

    cd $CLUSTERDIR/data/panther
    mv 10.0 $TOOLDIR/panther-common/
    ln -s ../../../../panther-common/10.0 .

Now make links for tools that are not distributed with InterProScan but we have locally.

SignalP 4.1:

    cd $CLUSTERDIR/bin/signalp/4.1/
    ln -s /sw/apps/bioinfo/SignalP/4.1/milou/signalp .

TMHMM 2.0c:

    cd $CLUSTERDIR/bin/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/milou/bin/decodeanhmm.Linux_x86_64 decodeanhmm
    cd $CLUSTERDIR/data/tmhmm/2.0c
    ln -s /sw/apps/bioinfo/tmhmm/2.0c/milou/lib/TMHMM2.0.model TMHMM2.0c.model

Update groups and permissions.

    cd $TOOLDIR
    chgrp -hR sw $VERSION
    chmod -R g+rwX,o+rX $VERSION
    find $VERSION -type d -exec chmod g+s {} \;

Make sure it works.  It takes several seconds to get going, but should only
complain about Phobius being deactivated.  Maybe we should add Phobius...

    cd $CLUSTERDIR
    ./interproscan.sh
    OPATH=$PATH
    export PATH=$CLUSTERDIR:$PATH
    cd
    interproscan.sh
    export PATH=$OPATH
    unset OPATH

Old mf file works fine.

