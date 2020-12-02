MUMmer/4.0.0rc1
===============

<https://github.com/mummer4/mummer>

Used under license:
Artistic License 2.0

Structure creating script (makeroom_MUMmer_4.0.0rc1.sh) moved to /sw/bioinfo/MUMmer/makeroom_4.0.0rc1.sh

LOG
---

    TOOL=MUMmer
    VERSION=4.0.0rc1
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/mummer4/mumme -d "versatile alignment tool for DNA and protein sequences" -l "Artistic License 2.0"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget https://github.com/mummer4/mummer/releases/download/v${VERSION}/mummer-${VERSION}.tar.gz
    tar xzf mummer-${VERSION}.tar.gz 
    cd mummer-${VERSION}/
    ml gcc/9.3.0
    ml perl/5.26.2
    ./configure --prefix=$PREFIX
    make
    make install

Check the perl scripts.

    cd $PREFIX/rackham/bin
    ml purge
    head -n 1 delta2vcf dnadiff mummerplot promer 
