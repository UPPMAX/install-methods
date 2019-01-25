BioPython 1.68
==============

<http://biopython.org/>

BioPython for Python 2

LOG
---

    VERSION=1.68
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/biopython
    mkdir -p ${VERSION}/$CLUSTER
    fixup -g $VERSION
    cd ${VERSION}
    [[ -f biopython-${VERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${VERSION}.tar.gz
    tar xzf biopython-${VERSION}.tar.gz
    mv biopython-${VERSION} src_${CLUSTER}
    cd src_${CLUSTER}
    module load python/2.7.6
    python setup.py install --prefix=/sw/apps/bioinfo/biopython/${VERSION}/$CLUSTER
    fixup -g /sw/apps/bioinfo/biopython/${VERSION}

