HiC-Pro/3.1.0
========================

<https://github.com/nservant/HiC-Pro>

Used under license:
BSD-3
<https://github.com/nservant/HiC-Pro/blob/master/LICENSE>

Structure creating script (makeroom_HiC-Pro_3.1.0.sh) moved to /sw/bioinfo/HiC-Pro/makeroom_3.1.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "HiC-Pro" "-v" "3.1.0" "-d" "An optimized and flexible pipeline for Hi-C data processing" "-w" "https://github.com/nservant/HiC-Pro" "-l" "BSD-3" "-L" "https://github.com/nservant/HiC-Pro/blob/master/LICENSE"
    ./makeroom_HiC-Pro_3.1.0.sh
HiC-Pro/2.11.1
========================

<https://github.com/nservant/HiC-Pro>

LOG
---

    TOOL=HiC-Pro
    VERSION=2.11.1
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_HiC-Pro_2.11.1.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/nservant/HiC-Pro.git
    cd HiC-Pro/
    module load bioinfo-tools bowtie2/2.3.4.1 python/2.7.15 samtools/1.8 gcc/7.3.0 R_packages/3.5.0
    mkdir /sw/apps/bioinfo/HiC-Pro/2.11.1/rackham/python_packages
    export PYTHONUSERBASE=/sw/apps/bioinfo/HiC-Pro/2.11.1/rackham/python_packages
    python -m pip install --user bx-python
    python -m pip install --user pysam
    export PYTHONPATH=/sw/apps/bioinfo/${TOOL}/${VERSION}/$Cluster/lib/python2.7/site-packages:$PYTHONPATH

# Added PREFIX=/sw/apps/bioinfo/HiC-Pro/2.11.1/rackham/ and CLUSTER_SYS = SLURM to config-install.txt

    make configure
    make install
