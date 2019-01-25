RepeatMasker/4.0.8
==================

<http://www.repeatmasker.org/>

Update 9-Oct-2017: vers2 patch for rmblast/2.6.0+

LOG
---

RepeatMasker/4.0.8 will have the same sequence-match tools configured with it that 4.0.7 did.

    cd /sw/bioinfo/RepeatMasker
    VERSION=4.0.8
    DLVERSION=${VERSION//./-}
    echo "Module version $VERSION, download version $DLVERSION"
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done

Don't make `$CLUSTER` because the unpacked RepeatMasker directory will become that

    mkdir src
    cd src
    wget http://www.repeatmasker.org/RepeatMasker-open-${DLVERSION}.tar.gz
    tar xzf RepeatMasker-open-${DLVERSION}.tar.gz 

Get the RepBase RepeatMasker edition following RepeatMasker instructions.
Downloading it from office Mac, and unpack.

    REPBASE_VERSION=RepeatMaskerEdition-20181026
    cd /sw/bioinfo/RepeatMasker/aux_rackham/lib
    rsync -Pt douglasscofield@fb166.ebc.uu.se:Downloads/RepBase${REPBASE_VERSION}.tar.gz .
    cd /sw/bioinfo/RepeatMasker/$VERSION/src/RepeatMasker/
    tar xvzf /sw/bioinfo/RepeatMasker/aux_rackham/lib/RepBase${REPBASE_VERSION}.tar.gz 

The Dfam_consensus database:

    DFAM_CONSENSUS_VERSION=20171107
    cd /sw/bioinfo/RepeatMasker/aux_rackham/lib
    wget http://www.dfam-consensus.org/assets/download/Dfam_consensus-${DFAM_CONSENSUS_VERSION}.tar.gz
    cd /sw/bioinfo/RepeatMasker/$VERSION/src/RepeatMasker/Libraries/
    tar xvzf /sw/bioinfo/RepeatMasker/aux_rackham/lib/Dfam_consensus-${DFAM_CONSENSUS_VERSION}.tar.gz

All required auxiliary programs are already in place from the installation of
RepeatMasker/4.0.7 and are found under:

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

