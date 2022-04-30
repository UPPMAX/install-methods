pblat/2.5
=========

<https://icebert.github.io/pblat/>

Used under license:

Custom free-to-academics
<https://github.com/icebert/pblat/blob/master/LICENSE>

Structure creating script (makeroom_pblat_2.5.sh) moved to /sw/bioinfo/pblat/makeroom_2.5.sh

LOG
---

    makeroom.sh -f -t pblat -v 2.5 -w https://icebert.github.io/pblat/ -l "Custom free-to-academics" -L https://github.com/icebert/pblat/blob/master/LICENSE -d "parallelized blat with multi-threads support"
    ./makeroom_pblat_2.5.sh 
    source /sw/bioinfo/pblat/SOURCEME_pblat_2.5 && cd $SRCDIR
    wget https://github.com/icebert/pblat/archive/refs/tags/2.5.tar.gz

    tar xvf 2.5.tar.gz 
    cd pblat-2.5/
    module load gcc/9.3.0 pcre/8.40 zlib/1.2.11
    make
    cp -av pblat $PREFIX/
    cd $PREFIX
    ldd pblat 

