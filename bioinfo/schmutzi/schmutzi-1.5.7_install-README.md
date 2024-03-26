schmutzi/1.5.7
==============

<https://github.com/grenaud/schmutzi>

Used under license:
GPL v3


Structure creating script (makeroom_schmutzi_1.5.7.sh) moved to /sw/bioinfo/schmutzi/makeroom_1.5.7.sh

Building was a mess, so use the statically linked binaries provided, and edit the perl, R and python scripts to work.

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "schmutzi" "-v" "1.5.7" "-w" "https://github.com/grenaud/schmutzi" "-d" "Bayesian maximum a posteriori contamination estimate for ancient samples" "-l" "GPL v3"
    ./makeroom_schmutzi_1.5.7.sh

schmutzi/20200706-597c6bc
=========================

<https://github.com/grenaud/schmutzi>

Used under license:
GPL v3

LOG
---

    TOOL=schmutzi
    COMMIT=a348d2c  # we don't version with this since the changes are tiny and are what we'd do to get things built anyway
    VERSION=1.5.7
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/grenaud/schmutzi -d "Bayesian maximum a posteriori contamination estimate for ancient samples" -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/bioinfo/$TOOL/SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR

Get statically build executables, **but no this doesn't work.**

    cd $SRCDIR
    for PROG in addXACircular bam2prof contDeam countRecords endoCaller insertSize log2ConsensusLog log2fasta log2freq logdiff logmask logs2pos mtCont poshap2splitbam subSampleBam ; do 
        wget --timestamping --continue https://github.com/grenaud/schmutzi/releases/download/v1.5.7/$PROG && chmod +x $PROG && mv $PROG $PREFIX/bin/
    done

**I thought I was all clever, but**

    ./bam2prof: /lib64/libm.so.6: version `GLIBC_2.29' not found 

So I have to build the things. The bamtools clone has a problem with a comparator not using const, so cannot build cleanly with gcc/12.3.0. Go back to gcc/9.3.0.

    ml gcc/9.3.0               # this is needed
    ml cmake/3.26.3
    ml git/2.34.1
    git clone --recursive https://github.com/grenaud/schmutzi.git
    cd schmutzi
    git reset --hard a348d2c   # a commit that provides some nice fixes for us
    make
    for PROG in addXACircular bam2prof contDeam countRecords endoCaller insertSize log2ConsensusLog log2fasta log2freq logdiff logmask logs2pos mtCont subSampleBAM ; do 
        cp -av src/$PROG $PREFIX/bin/
    done
    cp -av ./src/splitEndoVsCont/poshap2splitbam $PREFIX/bin/

    ml purge
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    for PROG in addXACircular bam2prof contDeam countRecords endoCaller insertSize log2ConsensusLog log2fasta log2freq logdiff logmask logs2pos mtCont poshap2splitbam subSampleBAM ; do 
        file $PROG
        ldd $PROG
        echo
        echo
    done

Provide share directory.

    cd $SRCDIR/schmutzi
    cp -av share $PREFIX/


Now handle scripts.

    cd $SRCDIR/schmutzi

    for SCRIPT in $( find . -name '*.pl' ; find . -name '*.R' ; find . -name '*.py' ) ; do
        echo $SCRIPT
        cp -av $SCRIPT $PREFIX/bin/
    done

Python script needs venv.  The fasta2haplogrep.py script seems not to be maintained, but we'll make a venv to manage it anyway.

    cd $PREFIX
    ml python/3.11.8
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    pip3 install numpy scipy biopython

Change to bin directory and change its #! line.

    cd bin
    sed -i -e '1i#!'"$(which python3)" fasta2haplogrep.py 
    head fasta2haplogrep.py 
    deactivate

This script also needs MAFFT/7.407 to be loaded.

R scripts all ok so long as we load R_packages/4.3.1

    head *.R

Perl scripts hardcode perl. Otherwise all OK so long as we load perl_modules/5.32.1

    head *.pl
    sed -i -e '1i#!/usr/bin/env perl' *.pl
    head -n 3 *.pl

For installation, we need a `.version` file since 1.5.7 preceeds the date-versioned versions.


Wrap up.  Update mf file. We need to load perl/5.32.1, perl_modules/5.32.1, R/4.3.1 and R_packages/4.3.1 along with MAFFT/7.407

    cd $TOOLDIR/mf
    vi 1.5.7

Set up version file, borrow from trinity. Set this version as the default.

    cp -av /sw/mf/common/bioinfo-tools/assembly/trinity/version .
    vi version
    rsync -Pa version /sw/mf/common/bioinfo-tools/misc/schmutzi/.version
    all_mflink -f schmutzi .version

Final wrap-up.

    ./schmutzi-1.5.7_post-install.sh 


Test with loaded module
-----------------------

    module load bioinfo-tools schmutzi/1.5.7

Now test. Need to add `--no-check-certificate` to the wget lines in the Makefile.

    cd $SRCDIR
    cd schmutzi
    vi Makefile
    make testdata

Then

    mkdir -p outputdir/

    contDeam.pl  --library single --out outputdir/mez testdata/mezB9687.bam
    contDeam.pl  --library double --out outputdir/sim testdata/simulation.bam
    schmutzi.pl  --uselength --ref $SCHMUTZI_ROOT/share/schmutzi/refs/human_MT_wrapped.fa outputdir/mez $SCHMUTZI_ROOT/share/schmutzi/alleleFreqMT/197/freqs/ testdata/mezB9687.bam
    schmutzi.pl  --uselength --ref $SCHMUTZI_ROOT/share/schmutzi/refs/human_MT_wrapped.fa outputdir/sim $SCHMUTZI_ROOT/share/schmutzi/alleleFreqMT/197/freqs/ testdata/simulation.bam

