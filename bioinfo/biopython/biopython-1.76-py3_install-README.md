biopython/1.76-py3
========================

<https://biopython.org>

Used under license:
Biopython License Agreement

Structure creating script (makeroom_biopython_1.76-py3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/biopython/makeroom_1.76-py3.sh

LOG
---

    TOOL=biopython
    TOOLVERSION=1.76
    VERSION=${TOOLVERSION}-py3
    PYTHONVERSION=3.7.2
    makeroom.sh -t "biopython" -v "1.76-py3" -w "https://biopython.org" -l "Biopython License Agreement" -d "Python packages for doing bioinformatics tasks" -f
    ./makeroom_biopython_1.76-py3.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSION
    cd src
    [[ -f biopython-${TOOLVERSION}.tar.gz ]] || wget http://biopython.org/DIST/biopython-${TOOLVERSION}.tar.gz
    [[ -d biopython-${TOOLVERSION} ]] && rm -rf biopython-${TOOLVERSION}
    tar xzf biopython-${TOOLVERSION}.tar.gz
    cd biopython-${TOOLVERSION}
    module load python/$PYTHONVERSION
    python3 setup.py install --prefix=$PREFIX

