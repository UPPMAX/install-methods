# mrCaNaVaR-0.51-install-README.md

mrCaNaVaR/0.51
==============

<http://mrcanavar.sourceforge.net/>

LOG
---

    VERSION=0.51
    CLUSTER=milou
    module load gcc/5.3.0
    cd /sw/apps/bioinfo/
    mkdir mrCaNaVaR
    cd mrCaNaVaR/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir -p src
    cd src
    wget http://downloads.sourceforge.net/project/mrcanavar/mrcanavar-$(VERSION}.tar.gz
    tar xzf mrcanavar-${VERSION}.tar.gz 
    mv mrcanavar-${VERSION} mrmrcanavar-${VERSION}-${CLUSTER}
    cd  mrcanavar-${VERSION}-${CLUSTER}
    make
    mv mrcanavar ../../$CLUSTER/

Repeat for tintin.

Use simple mf, put in `misc` subgroup of `biointo-tools`.

