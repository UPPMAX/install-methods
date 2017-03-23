RepeatModeler/1.0.8_RM4.0.7
===========================

Version of RepeatModeler/1.0.8 coupled to newer RepeatMasker/4.0.7 and newer
auxiliary tools.

<http://www.repeatmasker.org/RepeatModeler.html>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOLVERSION=1-0-8
    VERSION=1.0.8_RM4.0.7

    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget http://www.repeatmasker.org/RepeatModeler-open-${TOOLVERSION}.tar.gz
    tar xvzf RepeatModeler-open-${TOOLVERSION}.tar.gz 

As for RepeatMasker, move the unpacked directory to be $CLUSTER and configure there.

    mv RepeatModeler ../$CLUSTER
    cd ../$CLUSTER
    module load perl/5.18.4 perl_modules/5.18.4

Turns out I have to do some `#!` fixing right away.  This also doesn't have the
env option that RepeatMasker/4.0.7 does, so give full path to perl interpreter.
Don't include `/pica` prefix.  Include setups for RepeatMasker/4.0.7, rmblast
2.6.0+, TRF 4.09, RECON, RepeatScout.

    vi configure 
    ./configure 

Check for missing `#!` fixes.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '5.18.4'
    vi util/Linup util/viewMSA.pl 

