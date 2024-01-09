RepeatMasker/4.1.5
========================

<http://>

Used under license:


**NOTE** Using the complete Dfam.h5 is good, but don't keep a copy here. We've
got a copy at /sw/data/Dfam/3.7/rackham/Dfam.h5 so I've replaced the version
under Libraries/ with it.

**NOTE** After the complete RepeatMaskerLib.h5 is built, move it to 
/sw/data/RepeatMasker_data/4.1.5/rackham/Libraries/RepeatMaskerLib.h5.
See the READMEs in /sw/data/RepeatMasker_data.



Structure creating script (makeroom_RepeatMasker_4.1.5.sh) moved to /sw/bioinfo/RepeatMasker/makeroom_4.1.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "RepeatMasker" "-v" "4.1.5" "-f"
    ./makeroom_RepeatMasker_4.1.5.sh

    cd $SRCDIR
    rmdir $PREFIX
    wget https://www.repeatmasker.org/RepeatMasker/${TOOL}-${VERSION}.tar.gz
    tar xzfv RepeatMasker-${VERSION}.tar.gz 
    mv RepeatMasker $PREFIX


### Databases

Get the RepBase RepeatMasker edition following RepeatMasker instructions.  The latest version is already available on UPPMAX.

    REPBASE_VERSION=RepeatMaskerEdition-20181026
    cd $PREFIX
    tar xvzf $TOOLDIR/aux_rackham/lib/RepBase${REPBASE_VERSION}.tar.gz 

The small Dfam.h5 database is shipped with RepeatMasker. I will replace it with the complete one.
    mv $PREFIX/Libraries/Dfam.h5.gz $PREFIX/Libraries/Dfam.h5.gz.old
    mv $PREFIX/Libraries/Dfam.h5 $PREFIX/Libraries/Dfam.h5.small.old
    wget --no-check-certificate https://www.dfam.org/releases/Dfam_3.7/families/Dfam.h5.gz -P $PREFIX/Libraries/
    cd $PREFIX/Libraries
    gunzip Dfam.h5.gz


### Auxiliary programs

Some auxiliary programs are already in place from the installation of RepeatMasker/4.0.8 and are found under:

    $TOOLDIR/aux_rackham/

TRF, Tandem Repeat Finder version 4.09 for 64-bit linux (<https://tandem.bu.edu/trf/trf.html>).  Already at:

    $TOOLDIR/aux_rackham/TRF/4.0.9/trf

RMBlastn 2.14 is the latest version of RMBlastn.  Download the prebuilt one from RepeatMasker:

    cd $TOOLDIR/aux_rackham/rmblast/
    RMBLAST_VERSION=2.14.0
    wget http://www.repeatmasker.org/rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    tar xzfv rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    RMB_PREFIX=$TOOLDIR/aux_rackham/rmblast/rmblast-${RMBLAST_VERSION}/bin

nseg, not actually needed here but for RepeatModeler (<http://www.repeatmasker.org/RepeatModeler.html>) (quite old, from <ftp://ftp.ncbi.nih.gov/pub/seg/nseg/>).
Already taken care of.

    $TOOLDIR/aux_rackham/nseg/{nseg,nmerge}

cross_match also already there:
    $TOOLDIR/aux_rackham/cross_match_src/cross_match

Install
    cd $PREFIX
    module load perl/5.26.2 perl_modules/5.26.2 python/3.7.2

    which perl
    ./configure \
    -rmblast_dir /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/rmblast-2.14.0/bin \
    -trf_prgm /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.09/trf \ 
    -default_search_engine rmblast \
    -hmmer_dir /sw/bioinfo/hmmer/3.2.1/rackham/bin \
    -crossmatch_dir /sw/bioinfo/RepeatMasker/aux_rackham/cross_match_src/cross_match


And check the tree to see if anything else might need to have `#!` line fixed.
Note that module files (`*.pm`) do not need that fixed.
    find . -type d -iname "Libraries" -prune -o -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env' | grep -v "\#\!\/sw"
There were several in the `util/` directory.
    cd util
    sed -i.bak 's,^#!/usr.*perl.*$,#!/usr/bin/env perl,' *.pl trfMask



RepeatMasker/4.1.2-p1
========================

<http://>

Used under license:



Structure creating script (makeroom_RepeatMasker_4.1.2-p1.sh) moved to /sw/bioinfo/RepeatMasker/makeroom_4.1.2-p1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "RepeatMasker" -v "4.1.2-p1" -d "screens DNA sequences for interspersed repeats and low complexity DNA sequences" -s "annotation" -f
    ./makeroom_RepeatMasker_4.1.2-p1.sh

    TOOL=RepeatMasker
    VERSION=4.1.2-p1
    source /sw/bioinfo/RepeatMasker/SOURCEME_RepeatMasker_4.1.2-p1 && cd $TOOLDIR
    
    cd $SRCDIR
    rmdir $PREFIX
    wget https://www.repeatmasker.org/RepeatMasker/${TOOL}-${VERSION}.tar.gz
    tar xzfv RepeatMasker-${VERSION}.tar.gz 
    mv RepeatMasker $PREFIX




### Databases

Get the RepBase RepeatMasker edition following RepeatMasker instructions.  The latest version is already available on UPPMAX.

    cd $TOOLDIR/aux_rackham/lib
    REPBASE_VERSION=RepeatMaskerEdition-20181026
    cd $PREFIX
    tar xvzf $TOOLDIR/aux_rackham/lib/RepBase${REPBASE_VERSION}.tar.gz 

The small Dfam.h5 database is shipped with RepeatMasker. I will replace it with the complete one.
    mv $PREFIX/Libraries/Dfam.h5 $PREFIX/Libraries/Dfam.h5.small.old
    wget --no-check-certificate https://www.dfam.org/releases/Dfam_3.4/families/Dfam.h5.gz -P $PREFIX/Libraries/
    cd $PREFIX/Libraries
    gzip -d Dfam.h5.gz


### Auxiliary programs

Some auxiliary programs are already in place from the installation of RepeatMasker/4.0.8 and are found under:

    $TOOLDIR/aux_rackham/

TRF, Tandem Repeat Finder version 4.09 for 64-bit linux (<https://tandem.bu.edu/trf/trf.html>).  Already at:

    $TOOLDIR/aux_rackham/TRF/4.0.9/trf

RMBlastn 2.11.0+ is the latest version of RMBlastn.  Download the prebuilt one from RepeatMasker:

    cd $TOOLDIR/aux_rackham/rmblast/
    RMBLAST_VERSION=2.11.0
    wget http://www.repeatmasker.org/rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    tar xzfv rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    RMB_PREFIX=$TOOLDIR/aux_rackham/rmblast/rmblast-${RMBLAST_VERSION}/bin

nseg, not actually needed here but for RepeatModeler (<http://www.repeatmasker.org/RepeatModeler.html>) (quite old, from <ftp://ftp.ncbi.nih.gov/pub/seg/nseg/>).
Already taken care of.

    $TOOLDIR/aux_rackham/nseg/{nseg,nmerge}

cross_match also already there:
    $TOOLDIR/aux_rackham/cross_match_src/cross_match

Install
    cd $PREFIX
    module load perl/5.26.2 perl_modules/5.26.2 python/3.7.2

    which perl
    ./configure \\
    -rmblast_dir /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/rmblast-2.11.0/bin \\
    -trf_prgm /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.09/trf \\ 
    -hmmer_dir /sw/bioinfo/hmmer/3.2.1/rackham/bin \\
    -crossmatch_dir /sw/bioinfo/RepeatMasker/aux_rackham/cross_match_src/cross_match


And check the tree to see if anything else might need to have `#!` line fixed.
Note that module files (`*.pm`) do not need that fixed.
    find . -type d -iname "Libraries" -prune -o -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env' | grep -v "\#\!\/sw"
There were several in the `util/` directory.
    cd util
    sed -i.bak 's,^#!/usr.*perl.*$,#!/usr/bin/env perl,' *.pl trfMask



"
RepeatMasker Configuration Program


Checking for libraries...

Rebuilding RepeatMaskerLib.h5 master library
  Merging Dfam + RepBase into RepeatMaskerLib.h5 library.....................
  .............................................................................
  .............................................................................
  ..................................................

  File: /sw/bioinfo/RepeatMasker/4.1.2-p1/rackham/Libraries/RepeatMaskerLib.h5
  Database: Dfam withRBRM
  Version: 3.4
  Date: 2021-07-21

  Dfam - A database of transposable element (TE) sequence alignments and HMMs.
  RBRM - RepBase RepeatMasker Edition - version 20181026

  Total consensus sequences: 326778
  Total HMMs: 281913

  .
  Building FASTA version of RepeatMasker.lib ..................................
  Building RMBlast frozen libraries..
  The program is installed with a the following repeat libraries:
  File: /sw/bioinfo/RepeatMasker/4.1.2-p1/rackham/Libraries/RepeatMaskerLib.h5
  Database: Dfam withRBRM
  Version: 3.4
  Date: 2021-07-21

  Dfam - A database of transposable element (TE) sequence alignments and HMMs.
  RBRM - RepBase RepeatMasker Edition - version 20181026

  Total consensus sequences: 326778
  Total HMMs: 281913


  Further documentation on the program may be found here:
    /sw/bioinfo/RepeatMasker/4.1.2-p1/rackham/repeatmasker.help
"







RepeatMasker/4.1.0
==================

<http://www.repeatmasker.org/>

Used under license:


Structure creating script (makeroom_RepeatMasker_4.1.0.sh) moved to /sw/bioinfo/RepeatMasker/makeroom_4.1.0.sh

LOG
---

    TOOL=RepeatMasker
    VERSION=4.1.0
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "$TOOL" -v "${VERSION}" -s "annotation" -d "screens DNA sequences for interspersed repeats and low complexity DNA sequences" -w "http://www.repeatmasker.org/"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSION/src
    rmdir $PREFIX
    wget http://www.repeatmasker.org/RepeatMasker-${VERSION}.tar.gz
    tar xzf RepeatMasker-${VERSION}.tar.gz 
    mv RepeatMaster $PREFIX


### Databases

Get the RepBase RepeatMasker edition following RepeatMasker instructions.  The latest version is already available on UPPMAX.

    cd $TOOLDIR/aux_rackham/lib
    REPBASE_VERSION=RepeatMaskerEdition-20181026
    cd $PREFIX
    tar xvzf $TOOLDIR/aux_rackham/lib/RepBase${REPBASE_VERSION}.tar.gz 

The Dfam database is shipped with RepeatMasker, but I'm checking to see if the new edition is different.
The below code will do that, but there's no difference.

    cd $TOOLDIR/aux_rackham/lib
    wget --no-check-certificate https://www.dfam.org/releases/Dfam_3.1/families/Dfam.hmm.gz
    if ! diff <(zcat Dfam.hmm.gz) $PREFIX/Libraries/Dfam.hmm ; then
        mv $PREFIX/Libraries/Dfam.hmm $PREFIX/Libraries/Dfam.hmm.orig
        gunzip -c Dfam.hmm.gz > $PREFIX/Libraries/Dfam.hmm
    fi


### Auxiliary programs

Some auxiliary programs are already in place from the installation of RepeatMasker/4.0.8 and are found under:

    $TOOLDIR/aux_rackham/

TRF, Tandem Repeat Finder version 4.09 for 64-bit linux (<https://tandem.bu.edu/trf/trf.html>).  Already at:

    $TOOLDIR/aux_rackham/TRF/4.0.9/trf

RMBlastn 2.10.0+ is the latest version of RMBlastn.  Download the prebuilt one from RepeatMasker:

    cd $TOOLDIR/aux_rackham/rmblast/
    RMBLAST_VERSION=2.10.0
    wget http://www.repeatmasker.org/rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    tar xzf rmblast-${RMBLAST_VERSION}+-x64-linux.tar.gz
    RMB_PREFIX=$PWD/rmblast-${RMBLAST_VERSION}/bin

nseg, not actually needed here but for RepeatModeler (<http://www.repeatmasker.org/RepeatModeler.html>) (quite old, from <ftp://ftp.ncbi.nih.gov/pub/seg/nseg/>).
Already taken care of.

    $TOOLDIR/aux_rackham/nseg/{nseg,nmerge}

cross_match also already there:

    $TOOLDIR/aux_rackham/cross_match_src/cross_match

Now create `$CLUSTER` from the RepeatMasker directory and configure it with the
available sequence tools.  Note that it wants directories in which the tools can
be found, not direct paths to the tools.

    cd $PREFIX
    module load perl/5.26.2 perl_modules/5.26.2
    which perl
    ./configure 

It sets the path to perl to what it finds with `which`.  It also did not find a file it expected, `util/maskFile.pl`.  Is this the file replaced by `util/RM2Bed.py` ?
The default sequence search method should be rmblastn.

Location for TRF:

    /sw/bioinfo/RepeatMasker/aux_rackham/TRF/4.09/trf

Directory for cross_match:

    /sw/bioinfo/RepeatMasker/aux_rackham/cross_match_src

Directory for RMBlast:

    /sw/bioinfo/RepeatMasker/aux_rackham/rmblast/rmblast-2.10.0/bin

and Y to make RMBlast the default.

Directory for HMMER3.2.1:

    /sw/bioinfo/hmmer/3.2.1/rackham/bin


Check the configuration, see if anything might be missed.

    diff -W $COLUMNS -y RepeatMaskerConfig.pm.bak RepeatMaskerConfig.pm | less

And check the tree to see if anything else might need to have `#!` line fixed.
Note that module files (`*.pm`) do not need that fixed.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env'

There were several in the `util/` directory.

    cd util
    sed -i.bak 's,^#!/usr.*perl.*$,#!/usr/bin/env perl,' *.pl trfMask

The mf from 4.0.8 is a start, but we need to update the help message.

