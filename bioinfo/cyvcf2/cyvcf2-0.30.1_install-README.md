cyvcf2/0.30.1
========================

<http://>

Used under license:

<>

Structure creating script (makeroom_cyvcf2_0.30.1.sh) moved to /sw/bioinfo/cyvcf2/makeroom_0.30.1.sh

LOG
---

    TOOL=cyvcf2
    VERSION=0.30.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/cyvcf2/0.30.1/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "cyvcf2" -v "0.30.1" -f"
    ./makeroom_cyvcf2_0.30.1.sh
    cd $SRCDIR
    module load git/2.28.0
    git clone --recursive  https://github.com/brentp/cyvcf2.git
    git checkout v0.30.1
    git reset --hard v0.30.1
    module load python/3.7.2
    module load gcc/8.4.0
    cd $SRCDIR/cyvcf2/htslib
    autoheader
    autoconf
    ./configure --enable-libcurl
    make -j 4

    cd $SRCDIR/cyvcf2
    PYTHONUSERBASE=$PREFIX CYTHONIZE=1 pip install --user -r requirements.txt
    PYTHONUSERBASE=$PREFIX CYTHONIZE=1 pip install --user .

