RepeatModeler/1.0.11
===========================

Version of RepeatModeler/1.0.8 coupled to RepeatMasker/4.0.8 and newer
auxiliary tools.

<http://www.repeatmasker.org/RepeatModeler.html>

LOG
---

    cd /sw/bioinfo/RepeatModeler
    VERSION=1.0.11
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://www.repeatmasker.org/RepeatModeler/RepeatModeler-open-${VERSION}.tar.gz
    tar xvzf RepeatModeler-open-${VERSION}.tar.gz 

As for RepeatMasker, move the unpacked directory to be $CLUSTER and configure there.

    mv RepeatModeler-open-${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    module load perl/5.26.2 perl_modules/5.26.2

Check for files to fix `#!` lines for.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env'

Turns out I have to do some `#!` fixing right away.  This also doesn't have the
env option that RepeatMasker/4.0.7 does, so give full path to perl interpreter.
Don't include `/pica` prefix.  Include setups for RepeatMasker/4.0.7, rmblast
2.6.0+, TRF 4.09, RECON, RepeatScout.

    vi configure RepeatModeler

    vi configure 
    ./configure 

Check for missing `#!` fixes.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '5.18.4'
    vi util/Linup util/viewMSA.pl 

RepeatModeler 1.0.11 fixes the `use Cwd;` bug fixed by us in 1.0.8.

