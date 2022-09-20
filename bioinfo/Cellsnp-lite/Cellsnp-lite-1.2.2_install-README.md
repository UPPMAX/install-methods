Cellsnp-lite/1.2.2
========================

<https://github.com/single-cell-genetics/cellsnp-lite>

Used under license:
Apache License 2-0


Structure creating script (makeroom_Cellsnp-lite_1.2.2.sh) moved to /sw/bioinfo/Cellsnp-lite/makeroom_1.2.2.sh

LOG
---
     TOOL=Cellsnp-lite
    VERSION=1.2.2
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/single-cell-genetics/cellsnp-lite -s misc -l "Apache License 2-0" -d "cellsnp-lite is the C version of cellSNP, which is implemented in Python"
    
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    ml conda/latest
    export CONDA_ENVS_PATH=$PREFIX

   conda create -n CSP cellsnp-lite
