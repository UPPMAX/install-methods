MultiQC/1.10
========================

<https://multiqc.info>

Used under license:
MIT

Structure creating script (makeroom_MultiQC_1.10.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MultiQC/makeroom_1.10.sh

LOG
---

    TOOL=MultiQC
    VERSION=1.10
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/douglas/bin/makeroom.sh -f" -s "misc" -t "MultiQC" -v "1.10" -w "https://multiqc.info" -l "MIT" -d "Aggregate results from bioinformatics analyses across many samples into a single report"
    ./makeroom_MultiQC_1.10.sh
MultiQC/1.9
========================

<https://multiqc.info>

Used under license:
MIT

Structure creating script (makeroom_MultiQC_1.9.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MultiQC/makeroom_1.9.sh

LOG
---

    TOOL=MultiQC
    VERSION=1.9
    CLUSTER=rackham
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -s "misc" -t "MultiQC" -v "1.9" -w "https://multiqc.info" -l "MIT" -d "Aggregate results from bioinformatics analyses across many samples into a single report"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    PYTHONVERSION=3.7.2

    cd $PREFIX
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PREFIX pip install --user multiqc==$VERSION

