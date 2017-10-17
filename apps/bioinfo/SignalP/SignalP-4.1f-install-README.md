SignalP/4.1f
============

<http://www.cbs.dtu.dk/services/SignalP/>

Originally installed as SignalP/4.1.  There's a subversion which was obvious
when downloading but I'd missed it.

LOG
---

We need perl > 5.6 and gnuplot > 4.0.

    VERSION=4.1f
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/SignalP
    mkdir -p $TOOL $TOOL/mf
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p src
    cd src

Do not create directory for the cluster yet, we will move the unpacked
directory to it.  Had to download SignalP to my laptop after agreeing to
licence, so get it and its licence file from there.

    tar xzf signalp-${VERSION}.Linux.tar.gz 
    chmod -R g+rwX,o+rX signalp-${VERSION%?}
    mv signalp-${VERSION%?} $TOOL/$VERSION/$CLUSTER
    cd $CLUSTERDIR
    mkdir -p man/man1
    cp signalp.1 man/man1/

Following the installation instructions, update the signalp perl script to point to the correct places for things.

    milou-b: /sw/apps/bioinfo/SignalP $ diff src/signalp-${VERSION%?}/signalp ${VERSION}/$CLUSTER/signalp
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
    >     $ENV{CLUSTER} or die 'the $CLUSTER environment variable must be set';  ##UPPMAX
    >     $ENV{SIGNALP} = '/sw/apps/bioinfo/SignalP/4.1c/' . $ENV{CLUSTER};  ##UPPMAX
    17c20,21
    < my $outputDir = "/var/tmp";
    ---
    > #my $outputDir = "/var/tmp";  ##UPPMAX
    > $ENV{SNIC_TMP} or die 'the $SNIC_TMP environment variable must be set'; ##UPPMAX
    > my $outputDir = $ENV{SNIC_TMP};  ##UPPMAX
    20c24,25
    < my $MAX_ALLOWED_ENTRIES=10000;
    ---
    > #my $MAX_ALLOWED_ENTRIES=10000;  ##UPPMAX
    > my $MAX_ALLOWED_ENTRIES=1000000000;  ##UPPMAX


For the mf file, add $modroot to PATH and $modroot/man to MANPATH.

