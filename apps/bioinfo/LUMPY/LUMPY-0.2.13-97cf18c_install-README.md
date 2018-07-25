LUMPY/0.2.13-97cf18c
========================

<https://github.com/arq5x/lumpy-sv/>

LOG
---

#I did not install this for milou since it didn't compile correctly.

#On rackham

    TOOL=LUMPY
    VERSION=0.2.13-97cf18c
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_LUMPY_0.2.13-97cf18c.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/arq5x/lumpy-sv.git
    module load gcc/6.3.0
    module load bioinfo-tools
    module load pysam/0.13-python2.7.11
    module load sambamba/0.6.6
    module load samblaster/0.1.24
    module load samtools/1.2
    cd lumpy-sv
    make
    mkdir -p  /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin
    cp -av bin/*  /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin/


For the mf file, we need

    module load pysam/0.13-python2.7.11
    module load sambamba/0.6.6
    module load samblaster/0.1.24
    module load samtools/1.2
