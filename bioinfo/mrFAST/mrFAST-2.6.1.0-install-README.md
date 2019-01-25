# mrFAST-2.6.1.0-install-README.md

mrFAST/2.6.1.0
==============

<http://mrfast.sourceforge.net/>

LOG
---

    VERSION=2.6.1.0
    CLUSTER=milou
    module load gcc/5.3.0
    cd /sw/apps/bioinfo/
    mkdir mrFAST
    cd mrFAST/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    wget http://downloads.sourceforge.net/project/mrfast/mrfast/mrfast-${VERSION}.tar.gz
    tar xzf mrfast-${VERSION}.tar.gz 
    mv mrfast-${VERSION} mrfast-${VERSION}-${CLUSTER}
    cd  mrfast-${VERSION}-${CLUSTER}
    make
    mv mrfast ../../$CLUSTER/

Repeat for tintin.

Use simple mf, put in `alignment` subgroup of `biointo-tools`.
