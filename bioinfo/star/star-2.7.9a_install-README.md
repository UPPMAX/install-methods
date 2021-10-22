star/2.7.9a
===========

<https://github.com/alexdobin/STAR>

Used under license:
MIT


Structure creating script (makeroom_star_2.7.9a.sh) moved to /sw/bioinfo/star/makeroom_2.7.9a.sh

LOG
---

    TOOL=star
    VERSION=2.7.9a
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://github.com/alexdobin/STAR -d "Spliced Transcripts Alignment to a Reference" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION} 

    cd $SRCDIR
    wget https://github.com/alexdobin/STAR/archive/$VERSION.tar.gz
    tar -xzf $VERSION.tar.gz
    cd STAR-$VERSION
    module load gcc/9.3.0

    cd source
    make -j4
    mkdir -p $PREFIX/bin
    cp -av STAR $PREFIX/bin
    make clean                     # clean is incomplete
    ( cd htslib ; make clean )     # second clean includes cram subfolder
    make STARlong
    cp -av STARlong $PREFIX/bin

    cd $PREFIX/bin
    ln -s STAR star
    ln -s STARlong starlong

