BioPython 1.73
==============

<http://biopython.org/>

BioPython for Python 2.7.15

LOG
---

    VERSION=1.73
    PYTHONVERSION=2.7.15
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/biopython
    mkdir -p ${VERSION}/$CLUSTER
    cd ${VERSION}
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src
    [[ -f biopython-${VERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${VERSION}.tar.gz
    tar xzf biopython-${VERSION}.tar.gz
    cd biopython-${VERSION}
    module load python/$PYTHONVERSION
    python setup.py install --prefix=/sw/bioinfo/biopython/${VERSION}/$CLUSTER
    fixup /sw/bioinfo/biopython/${VERSION}

