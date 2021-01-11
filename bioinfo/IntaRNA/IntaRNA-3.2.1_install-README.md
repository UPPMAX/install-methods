IntaRNA/3.2.1
========================

<https://backofenlab.github.io/IntaRNA/>

Used under license:
MIT

Structure creating script (makeroom_IntaRNA_3.2.1.sh) moved to /sw/bioinfo/IntaRNA/makeroom_3.2.1.sh

LOG
---

    TOOL=IntaRNA
    VERSION=3.2.1
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w https://backofenlab.github.io/IntaRNA/ -s misc -d "efficient RNA-RNA interaction prediction incorporating accessibility and seeding of interaction sites" 
    ./makeroom_IntaRNA_3.2.1.sh 
    cd IntaRNA/
    source SOURCEME_IntaRNA_3.2.1 
    cd 3.2.1
    cd src/
    wget https://github.com/BackofenLab/IntaRNA/releases/download/v3.2.1/intaRNA-3.2.1.tar.gz
    tar xzf intaRNA-3.2.1.tar.gz 
    cd intaRNA-3.2.1/
    ./configure --help
    ml python3/3.7.2
    ml doxygen/1.8.11
    ml texlive/2019
    ml boost/1.63.0_gcc6.3.0
    ml gsl/2.6
    ml zlib/1.2.11
    ml gcc/8.3.0
    ./configure --with-boost=$BOOST_ROOT --with-vrna=$VIENNARNA_ROOT --enable-intarnapvalue --prefix=$PREFIX
    make
    make tests
    make install

Now check libraries

    ml purge
    ml python3/3.7.2
    cd $PREFIX
    ldd bin/IntaRNA

Instruct users to load these modules to build:

    module load gcc/8.3.0
    module load boost/1.63.0_gcc6.3.0
    module load gsl/2.6
    module load zlib/1.2.11
