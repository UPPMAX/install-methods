MultiQC/1.11
========================

<https://multiqc.info>

Used under license:
MIT

Structure creating script (makeroom_MultiQC_1.10.1.sh) moved to /sw/bioinfo/MultiQC/makeroom_1.10.1.sh



**NOTE** with the next minor version bump, bump the python used to 3.8.7.



LOG
---

    TOOL=MultiQC
    VERSION=1.11
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -s "misc" -t "$TOOL" -v "$VERSION" -w "https://multiqc.info" -l "MIT" -d "Aggregate results from bioinformatics analyses across many samples into a single report"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    PYTHONVERSION=3.7.2

    cd $PREFIX
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PREFIX pip install --user multiqc==$VERSION

