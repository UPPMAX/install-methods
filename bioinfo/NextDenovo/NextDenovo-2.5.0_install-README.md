NextDenovo/2.5.0
========================

<https://github.com/Nextomics/NextDenovo>

Used under license:
GNU


Structure creating script (makeroom_NextDenovo_2.5.0.sh) moved to /sw/bioinfo/NextDenovo/makeroom_2.5.0.sh

LOG
---

    TOOL=NextDenovo
    VERSION=2.5.0
    makeroom.sh -f -t $TOOL -v $VERSION -s assembly -w https://github.com/Nextomics/NextDenovo -l 'GNU' -d 'NextDenovo is a string graph-based de novo assembler for long reads (CLR, HiFi and ONT)'

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    wget https://github.com/Nextomics/NextDenovo/releases/download/v$VERSION/NextDenovo.tgz
    rmdir $PREFIX
    tar xzf NextDenovo.tgz
    mv NextDenovo $PREFIX 
    cd $PREFIX
    module load python/3.9.5
    PYTHONUSERBASE=python_packages pip install --user psutil Drmaa paralleltask
