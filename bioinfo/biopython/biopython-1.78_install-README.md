biopython/1.78
==================

<https://biopython.org>

Used under license:
Biopython License Agreement

Structure creating script (makeroom_biopython_1.78.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/biopython/makeroom_1.8.sh

LOG
---

    TOOL=biopython
    VERSION=1.78
    PYTHONVERSION=3.8.7
    makeroom.sh -f -t "biopython" -v "1.78" -w "https://github.com/biopython/biopython" -l "Biopython License Agreement" -L "https://github.com/biopython/biopython/blob/master/LICENSE.rst" -d "Python packages for doing bioinformatics tasks"
    ./makeroom_biopython_1.78.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    [[ -f biopython-${VERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${VERSION}.tar.gz
    [[ -d biopython-${VERSION} ]] && rm -rf biopython-${VERSION}
    tar xf biopython-${VERSION}.tar.gz
    cd biopython-${VERSION}
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PREFIX pip install --user .

