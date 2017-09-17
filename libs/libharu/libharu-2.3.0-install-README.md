libharu/2.3.0
=============

Provides libhpdf.

LOG
---

    VERSION=2.3.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    REMOTEVERSION=${VERSION//./_}
    cd /sw/libs
    mkdir libharu
    cd libharu/
    mkdir ${VERSION} mf
    cd ${VERSION}/
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f RELEASE_${REMOTEVERSION}.tar.gz ]] || wget https://github.com/libharu/libharu/archive/RELEASE_${REMOTEVERSION}.tar.gz
    tar xzf RELEASE_${REMOTEVERSION}.tar.gz 
    mv libharu-RELEASE_${REMOTEVERSION}/ libharu-RELEASE_${REMOTEVERSION}-$CLUSTER/
    cd libharu-RELEASE_${REMOTEVERSION}-$CLUSTER/
    module load gcc/4.9.2
    ./buildconf.sh --force
    ./configure --prefix=$PFX
    make
    make install

