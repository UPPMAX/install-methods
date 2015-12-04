We need perl > 5.6 and gnuplot > 4.0.

    TOOL=/sw/apps/bioinfo/SignalP
    MF_DIR=$TOOL/mf
    SOURCEDIR=$TOOL/src
    VERSION=4.1
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $MF_DIR $SOURCEDIR
    cd $SOURCEDIR

Do not create $CLUSTERDIR yet, we will move the unpacked directory to it.  Had
to download SignalP to my desktop after agreeing to licence, so get it and its
licence file from there.

    rsync -Pt douglasscofield@ve64.ebc.uu.se:Downloads/signalp* .

    tar xzf signalp-4.1c.Linux.tar.gz 
    chmod -R g+rwX,o+rX signalp-4.1
    mv signalp-4.1 $CLUSTERDIR
    cd $CLUSTERDIR
    mkdir -p man/man1
    cp signalp.1 man/man1/

Following the installation instructions, update the signalp perl script to point to the correct places for things.

    milou-b: /sw/apps/bioinfo/SignalP $ diff src/signalp-4.1/signalp 4.1/milou/signalp
    1c1,3
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    >
    > ##!/usr/bin/perl  ##UPPMAX
    13c15,16
    <     $ENV{SIGNALP} = '/usr/cbs/bio/src/signalp-4.1';
    ---
    >     #$ENV{SIGNALP} = '/usr/cbs/bio/src/signalp-4.1';  ##UPPMAX
    >     $ENV{SIGNALP} = '/sw/apps/bioinfo/SignalP/4.1/milou';  ##UPPMAX
    17c20,21
    < my $outputDir = "/var/tmp";
    ---
    > #my $outputDir = "/var/tmp";  ##UPPMAX
    > my $outputDir = $ENV{SNIC_TMP};  ##UPPMAX
    20c24,25
    < my $MAX_ALLOWED_ENTRIES=10000;
    ---
    > #my $MAX_ALLOWED_ENTRIES=10000;  ##UPPMAX
    > my $MAX_ALLOWED_ENTRIES=1000000000;  ##UPPMAX


For the mf file, add $modroot to PATH and $modroot/man to MANPATH.
