funannotate/1.8.1
========================

<https://funannotate.readthedocs.io/en/latest/>

Used under license:
BSD 2-clause


LOG
---

    TOOL=funannotate
    VERSION=1.8.1
    makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://funannotate.readthedocs.io/en/latest/ -l "BSD 2-clause" -d "genome prediction, annotation, and comparison software package" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION} 
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install --user funannotate==${VERSION}

In the mf file, load python/3.7.2, and add the python3.7/site-packages directory to PYTHONPATH.
