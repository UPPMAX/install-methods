STAR/2.7.2b
===========

<https://github.com/alexdobin/STAR>

Looked for additional secondary targets such as STARlong, didn't find them.
Only targets for static versions, debugging versions, and Mac version.
STARsolo appears to be activated with specific options to STAR itself.

Used under license:
MIT

Structure creating script (makeroom_star_2.7.2b.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/star/makeroom_2.7.2b.sh


LOG
---

    TOOL=star
    VERSION=2.7.2b
    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://github.com/alexdobin/STAR -d "Spliced Transcripts Alignment to a Reference" -l "MIT"
    ./makeroom_star_2.7.2b.sh 
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION} 

    cd $VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    wget https://github.com/alexdobin/STAR/archive/$VERSION.tar.gz
    tar -xzf $VERSION.tar.gz
    cd STAR-$VERSION
    module load gcc/8.3.0

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

