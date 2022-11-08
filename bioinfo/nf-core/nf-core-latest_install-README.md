nf-core/latest
========================

<https://github.com/nf-core/tools>

Used under license:
MIT License
<https://github.com/nf-core/tools/blob/master/LICENSE>

Structure creating script (makeroom_nf-core_latest.sh) moved to /sw/bioinfo/nf-core/makeroom_latest.sh


# To update - done every weekend via acrontab on rackham5 with user pmitev
module load python/3.9.5
PYTHONUSERBASE=/sw/bioinfo/nf-core/latest/rackham pip install --user -U nf-core


LOG
---

    TOOL=nf-core
    VERSION=latest

    makeroom.sh -t $TOOL -v $VERSION -d "A companion tool is available for nf-core to help with common tasks." -w "https://github.com/nf-core/tools" -l "MIT License" -L "https://github.com/nf-core/tools/blob/master/LICENSE" -s "pipelines" -f


   ./makeroom_${TOOL}_${VERSION}.sh

    source ${TOOLDIR}_${TOOL}_${VERSION} && cd $TOOLDIR
    
    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX pip install --user nf-core
