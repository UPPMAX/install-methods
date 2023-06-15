BLAKE2/20230212-ed1974e
========================

<https://www.blake2.net/>

Used under license:
CC0-1.0 or OpenSSL or Apache Public Licence 2.0
<https://github.com/BLAKE2/BLAKE2>

Structure creating script (makeroom_BLAKE2_20230212-ed1974e.sh) moved to /sw/apps/BLAKE2/makeroom_20230212-ed1974e.sh

LOG
---

    makeroom.sh -f -c apps -t BLAKE2 -v 20230212-ed1974e -l "CC0-1.0 or OpenSSL or Apache Public Licence 2.0" -L https://github.com/BLAKE2/BLAKE2 -w https://www.blake2.net/ -d "Reference implementation of BLAKE2, a cryptographic hash function faster than MD5, SHA-1, SHA-2, and SHA-3, yet is at least as secure as the latest standard SHA-3. See the libb2 module for a C library implementing the algorithm"
    ./makeroom_BLAKE2_20230212-ed1974e.sh 
    source /sw/apps/BLAKE2/SOURCEME_BLAKE2_20230212-ed1974e && cd $SRCDIR
    ml git
    git clone https://github.com/BLAKE2/BLAKE2
    cd BLAKE2/
    git reset --hard ed1974e
    cd b2sum/
    make
    echo 'douglas' | ./b2sum
    ./b2sum --help

    mkdir -p $PREFIX/{bin,share/man/man1}
    cp -av b2sum $PREFIX/bin
    cp -av b2sum.1 $PREFIX/share/man/man1/

