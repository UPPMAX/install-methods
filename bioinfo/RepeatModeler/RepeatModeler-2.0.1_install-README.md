RepeatModeler/2.0.1
========================

<http://www.repeatmasker.org/RepeatModeler/>

Used under license:
open source

Structure creating script (makeroom_RepeatModeler_2.0.1.sh) moved to /sw/bioinfo/RepeatModeler/makeroom_2.0.1.sh

LOG
---

    TOOL=RepeatModeler
    VERSION=2.0.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/RepeatModeler/2.0.1/src
    /home/douglas/bin/makeroom.sh -f" -t "RepeatModeler" -v "2.0.1" -s "misc" -w "http://www.repeatmasker.org/RepeatModeler/" -l "open source" -d "de novo transposable element \(TE\) family identification and modeling package""
    ./makeroom_RepeatModeler_2.0.1.sh

module load perl/5.26.2 perl_modules/5.26.2

RepeatMasker:
    
    /sw/bioinfo/RepeatMasker/4.1.0/rackham

RECON:

    /sw/bioinfo/RepeatMasker/aux_rackham/RECON/1.08/bin

TRF (note not direct path to program, which is what RepeatMasker wants):

    /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.09/trf

RepeatScout:

    /sw/bioinfo/RepeatScout/1.0.6/rackham
    #/sw/apps/bioinfo/RepeatMasker/aux_rackham/RepeatScout/1.0.5/bin

NSEG:

    /sw/bioinfo/RepeatMasker/aux_rackham/nseg

RMBlast:

    /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/rmblast-2.10.0/bin


GenomeTools:

    /sw/bioinfo/GenomeTools/1.6.1/rackham/bin
    #/sw/apps/bioinfo/RepeatMasker/aux_rackham/GenomeTools/genometools-1.6.1/bin

LTR_retriever:

    /sw/bioinfo/LTR_retriever/2.9.0/src/LTR_retriever

MAFFT

    /sw/apps/bioinfo/MAFFT/7.407/rackham/bin

NINJA:

    /sw/bioinfo/NINJA/0.97-cluster_only/rackham
    #/sw/apps/build/ninja/1.9.0/rackham

CD-hit

    /sw/bioinfo/cd-hit/4.8.1/rackham



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
    module load perl/7.26.2 perl_modules/5.26.2

RepeatModeler 1.0.11 fixes the `use Cwd;` bug fixed by us in 1.0.8, so no need
to repeat that.

Check for files to fix `#!` lines for.  First command shows the files, second opens vi for all.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env'
    vi $(find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env' | cut -f1 -d:)

Turns out I have to do some `#!` fixing right away.  This also doesn't have the
env option that RepeatMasker/4.0.7 does, so give full path to perl interpreter.
Don't include `/pica` prefix.  Include setups for RepeatMasker/4.0.7, rmblast
2.6.0+, TRF 4.09, RECON, RepeatScout, NSEG:

    ./configure 

For RepeatMasker, the directory is

RECON:

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/RECON/1.08/bin

TRF (note not direct path to program, which is what RepeatMasker wants):

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/TRF/4.09

RepeatScout:

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/RepeatScout/1.0.5/bin

NSEG:

    /sw/bioinfo/RepeatMasker/aux_rackham/nseg

RMBlast:

    /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/2.6.0+/bin

