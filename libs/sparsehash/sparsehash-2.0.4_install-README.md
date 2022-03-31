sparsehash/2.0.4
================

<https://github.com/sparsehash/sparsehash>

Used under license:
BSD 3-clause
<https://raw.githubusercontent.com/sparsehash/sparsehash/master/COPYING>

Structure creating script (makeroom_sparsehash_2.0.4.sh) moved to /sw/libs/sparsehash/makeroom_2.0.4.sh

LOG
---

Build for compatibility, so gcc/5.4.0

    cd /sw/libs/sparsehash/
    makeroom.sh -f -t sparsehash -v 2.0.4 -c libs -w "https://github.com/sparsehash/sparsehash" -l "BSD 3-clause" -L https://raw.githubusercontent.com/sparsehash/sparsehash/master/COPYING
    ./makeroom_sparsehash_2.0.4.sh 
    source /sw/libs/sparsehash/SOURCEME_sparsehash_2.0.4 && cd $SRCDIR
    wget https://github.com/sparsehash/sparsehash/archive/refs/tags/sparsehash-2.0.4.tar.gz
    tar xf sparsehash-2.0.4.tar.gz 
    cd sparsehash-sparsehash-2.0.4/
    ml gcc/5.4.0
    ./configure --prefix=$PREFIX
    make -j4
    make check
    make install
    cd ..
    rm -rf sparsehash-sparsehash-2.0.4/

Same variables as the mf for 2.0.3. Compiling during installation is to handle
template issues, there is no compiled code in the final installation.

Add the version to the mf file.
