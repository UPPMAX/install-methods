velocyto/0.17.17
================

<http://velocyto.org/velocyto.py/index.html>

Used under license:
BSD 2-clause

Structure creating script (makeroom_velocyto_0.17.17.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/velocyto/makeroom_0.17.17.sh

Switching from installing from the source tree (missing several things) to installing with pip from PyPi.
The requirement of `samtools` was also missing from the prerequisites.

LOG
---

    TOOL=velocyto
    VERSION=0.17.17
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://velocyto.org/velocyto.py/index.html -l "BSD 2-clause" -d "library for the analysis of RNA velocity"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd velocyto/
    source SOURCEME_${TOOL}_${VERSION} 
    module load python/3.6.8
    PYTHONUSERBASE=$PREFIX pip install --user velocyto

    cd /sw/bioinfo/$TOOL/mf
    vi $VERSION

The mf file loads `python/3.6.8` and `samtools/1.9` and sets PATH and
PYTHONPATH.  Now copy it over to the mf tree.

    rsync  -Pa $VERSION /sw/mf/common/bioinfo-tools/misc/velocyto/
    all_mflink -f velocyto $VERSION

