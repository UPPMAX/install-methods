BioPython 1.68-py3
==================

<http://biopython.org/>

BioPython for Python 3

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
    mv biopython-${VERSION} src_py3_${CLUSTER}
    cd src_py3_${CLUSTER}
    module load python/3.4.3
    python3 setup.py install --prefix=/sw/apps/bioinfo/biopython/${VERSION}-py3/$CLUSTER
    fixup -g /sw/apps/bioinfo/biopython/${VERSION}-py3
