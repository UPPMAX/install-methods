hmmer/3.3.2
========================

<http://>

Used under license:



Structure creating script (makeroom_hmmer_3.3.2.sh) moved to /sw/bioinfo/hmmer/makeroom_3.3.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hmmer" "-v" "3.3.2" "-f"
    ./makeroom_hmmer_3.3.2.sh
    
    # Load modules
    module load gcc/12.3.0

    # Download
    cd $SRCDIR
    wget http://eddylab.org/software/hmmer/hmmer-${VERSION}.tar.gz
    tar xfvz hmmer-${VERSION}.tar.gz --strip-components=1

    # Install
    ./configure --prefix=$PREFIX 
    make -j 10
    make check
    make install

    # Test
    #I did the tutorial in http://eddylab.org/software/hmmer/Userguide.pdf. No problems on snowy either.
    cd $SRCDIR/tutorial

The 'gcc/12.3.0' module should not be loaded as a dependency.
