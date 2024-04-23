bcftools-score/1.18-20231207-9c8e21e
========================

<https://github.com/freeseek/score>

Used under license:
MIT


Structure creating script (makeroom_bcftools-score_1.18-20231207-9c8e21e.sh) moved to /sw/bioinfo/bcftools-score/makeroom_1.18-20231207-9c8e21e.sh

LOG
---

    ./makeroom_bcftools-score_1.18-20231207-9c8e21e.sh 
    source /sw/bioinfo/bcftools-score/SOURCEME_bcftools-score_1.18-20231207-9c8e21e && cd $SRCDIR
    wget https://github.com/samtools/bcftools/releases/download/1.18/bcftools-1.18.tar.bz2
    ml purge
    ml R/4.3.1
    ml SuiteSparse/7.7.0
    ml gsl/2.7
    tar xf bcftools-1.18.tar.bz2 
    cd bcftools-1.18/
    rm -vf plugins/{score.{c,h},{munge,liftover,metal,blup}.c,pgs.{c,mk}}
    wget -P plugins https://raw.githubusercontent.com/freeseek/score/master/{score.{c,h},{munge,liftover,metal,blup}.c,pgs.{c,mk}}
    ll plugins/{score.{c,h},{munge,liftover,metal,blup}.c,pgs.{c,mk}}
    cd htslib-1.18/
    echo $PREFIX
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j 10
    make install
    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
    make -j4 GSL_LIBS='-lgsl -lgslcblas' USE_GPL=1
    make install

    cd $PREFIX/libexec/bcftools
    ldd pgs.so 
    ml patchelf/0.10
    patchelf --print-rpath pgs.so

    cd $TOOLDIR/mf

    cp /sw/bioinfo/bcftools/mf/1.19 .
    cat 1.19 >> 1.18-20231207-9c8e21e 
    rm -f 1.19
    vi 1.18-20231207-9c8e21e 
