BioPython 1.73-py3
==============

<http://biopython.org/>

BioPython for Python 3.6.0

LOG
---

    VERSION=1.73
    MODULEVERSION=${VERSION}-py3
    PYTHONVERSION=3.6.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo/biopython
    mkdir -p ${MODULEVERSION}/$CLUSTER
    cd ${MODULEVERSION}
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src
    [[ -f biopython-${VERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${VERSION}.tar.gz
    tar xzf biopython-${VERSION}.tar.gz
    cd biopython-${VERSION}
    module load python/$PYTHONVERSION
    python3 setup.py install --prefix=/sw/bioinfo/biopython/${MODULEVERSION}/$CLUSTER
    fixup /sw/bioinfo/biopython/${MODULEVERSION}

