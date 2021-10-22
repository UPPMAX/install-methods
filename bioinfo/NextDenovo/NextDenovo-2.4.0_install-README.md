NextDenovo/2.4.0
========================

<https://github.com/Nextomics/NextDenovo>

Used under license:
GNU


Structure creating script (makeroom_NextDenovo_2.4.0.sh) moved to /sw/bioinfo/NextDenovo/makeroom_2.4.0.sh

LOG
---

    TOOL=NextDenovo
    VERSION=2.4.0
    makeroom.sh -f -t $TOOL -v $VERSION -s assembly -w https://github.com/Nextomics/NextDenovo -l 'GNU' -d 'NextDenovo is a string graph-based de novo assembler for long reads (CLR, HiFi and ONT)'

    ./makeroom_NextDenovo_2.4.0.sh
 
    source SOURCEME_NextDenovo_2.4.0

    cd $SRCDIR

    wget https://github.com/Nextomics/NextDenovo/releases/download/v2.4.0/NextDenovo.tgz
    rmdir $PREFIX
    tar xzf NextDenovo.tgz
    mv NextDenovo $PREFIX 
    cd $PREFIX
    module load python/3.8.7
    PYTHONUSERBASE=python_packages pip install --user psutil Drmaa

    prepend-path    PYTHONPATH          $modroot/python_packages/lib/python3.8/site-packages

    export PYTHONPATH=/sw/bioinfo/NextDenovo/2.4.0/rackham/python_packages/lib/python3.8/site-packages:$PYTHONPATH
