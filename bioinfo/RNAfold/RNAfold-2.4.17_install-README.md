RNAfold/2.4.17
========================

Also available as ViennaRNA/2.4.17.  When completed, create symlinks in /sw/mf/common/bioinfo-tools/misc/ViennaRNA to the appropriate RNAfold mf files.  The the end of the README for this.

<https://www.tbi.univie.ac.at/RNA/>

Used under license:
MIT

Structure creating script (makeroom_RNAfold_2.4.17.sh) moved to /sw/bioinfo/RNAfold/makeroom_2.4.17.sh


LOG
---

    TOOL=RNAfold
    VERSION=2.4.17
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w https://www.tbi.univie.ac.at/RNA/ -d "a C code library and several stand-alone programs for the prediction and comparison of RNA secondary structures" 
    ./makeroom_RNAfold_2.4.17.sh 
    source SOURCEME_RNAfold_2.4.17 
    cd 2.4.17/
    cd src/
    wget https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_4_x/ViennaRNA-2.4.17.tar.gz
    tar xzf ViennaRNA-2.4.17.tar.gz 
    cd ViennaRNA-2.4.17/
    module load perl_modules/5.26.2
    module load python/2.7.15
    module load python3/3.7.2
    module load swig/3.0.12
    module load gcc/9.3.0
    ./configure --with-cluster --with-kinwalker --prefix=$PREFIX
    make
    make check
    make install

And do the post-install step.  Then:

Create symlinks for ViennaRNA/2.4.17.

    cd /sw/mf/common/bioinfo-tools/misc/ViennaRNA
    ln -s ../RNAfold/2.4.17 .
    all_mflink -f ViennaRNA 2.4.17
