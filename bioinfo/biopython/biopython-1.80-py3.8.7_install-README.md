biopython/1.80-py3.8.7
======================

<https://biopython.org>

Used under license:
Biopython License Agreement

Structure creating script (makeroom_biopython_1.80.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/biopython/makeroom_1.8.sh

LOG
---

    TOOL=biopython
    TOOLVERSION=1.80
    PYTHONVERSION=3.8.7
    GCCVERSION=9.3.0
    VERSION=${TOOLVERSION}-py${PYTHONVERSION}
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -w "https://github.com/biopython/biopython" -l "Biopython License Agreement" -L "https://github.com/biopython/biopython/blob/master/LICENSE.rst" -d "Python packages for doing bioinformatics tasks"
    ./makeroom_biopython_${VERSION}.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    [[ -f biopython-${TOOLVERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${TOOLVERSION}.tar.gz
    [[ -d biopython-${TOOLVERSION} ]] && rm -rf biopython-${TOOLVERSION}
    tar xf biopython-${TOOLVERSION}.tar.gz
    cd biopython-${TOOLVERSION}
    module load python/$PYTHONVERSION
    module load gcc/$GCCVERSION
    PYTHONUSERBASE=$PREFIX pip install --user .

