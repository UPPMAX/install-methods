VerifyBamID2/1.0.6
==================

<http://griffan.github.io/VerifyBamID>

Used under license:
MIT

Structure creating script (makeroom_verifyBamID2_1.0.6.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/verifyBamID2/makeroom_1.0.6.sh

LOG
---

    TOOL=VerifyBamID2
    VERSION=1.0.6
    cd /sw/bioinfo
    mkdir VerifyBamID2
    cd VerifyBamID2
    makeroom.sh -f -t $TOOL -v ${VERSION} -s misc -w http://griffan.github.io/VerifyBamID -d "robust tool for DNA contamination estimation from sequence reads using ancestry-agnostic method" -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 

    cd $VERSIONDIR
    cd src
    wget https://github.com/Griffan/VerifyBamID/archive/${VERSION}.tar.gz
    tar xzf $VERSION.tar.gz
    cd VerifyBamID-${VERSION}/
    mkdir build
    cd build
    module load gcc/9.1.0
    module load cmake/3.13.2
    module load bioinfo-tools htslib/1.8
    echo $PREFIX
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DHTS_INCLUDE_DIRS=$HTSLIB_ROOT/include -DHTS_LIBRARIES=$HTSLIB_ROOT/lib/libhts.a
    make
    make test
    make install
    cd ..
    cp -av bin resource $PREFIX/
    cd $PREFIX/
    cd bin/
    chmod +x run.plot.sh 

To use this script, an R_packages module must be loaded.

