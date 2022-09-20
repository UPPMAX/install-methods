nf-core/2.4.1
========================

<https://github.com/nf-core/tools>

Used under license:
MIT License
<https://github.com/nf-core/tools/blob/master/LICENSE>

Structure creating script (makeroom_nf-core_2.4.1.sh) moved to /sw/bioinfo/nf-core/makeroom_2.4.1.sh

LOG
---

    TOOL=nf-core
    VERSION=2.4.1

    /home/niharika/install-methods/makeroom.sh -t $TOOL -v $VERSION -d "A companion tool is available for nf-core to help with common tasks." -w "https://github.com/nf-core/tools" -l "MIT License" -L "https://github.com/nf-core/tools/blob/master/LICENSE" -s "pipelines" -f


   ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    

    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX pip install --user nf-core
