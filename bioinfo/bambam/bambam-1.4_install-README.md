bambam/1.4
==========

<https://sourceforge.net/projects/bambam/>

It is an older tool, so needs to be built with an older bamtools, and it needs
samtools' libbam.a and libhts.a, which are available within the source tree of
samtools/1.4.

LOG
---

    VERSION=1.4
    cd /sw/bioinfo
    mkdir -p bambam
    cd bambam
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma snowy ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -f bambam-${VERSION}.tgz ]] || wget https://downloads.sourceforge.net/project/bambam/bambam-${VERSION}.tgz
    [[ -d bambam ]] && rm -rf bambam
    tar xzf bambam-${VERSION}.tgz
    module load bioinfo-tools
    module load bamtools/2.3.0
    module load samtools/1.4
    export LIBRARY_PATH=$LIBRARY_PATH:$SAMTOOLS_ROOT/../src/samtools-1.4:$SAMTOOLS_ROOT/../src/samtools-1.4/htslib-1.4
    make
    cp -av bin lib scripts $PREFIX/

Check the RPATH info, and that scripts are OK.

    cd $PREFIX/bin
    ldd subBam
    cd $PREFIX/scripts
    pi.pl

