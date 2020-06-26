genomescope2.0/1.0.0_5034ed4
========================

<https://github.com/tbenavi1/genomescope2.0>

Used under license:
Apache-2.0

Structure creating script (makeroom_genomescope2.0_1.0.0_5034ed4.sh) moved to /sw/bioinfo/genomescope2.0/makeroom_1.0.0_5034ed4.sh

LOG
---

    TOOL=genomescope2.0
    VERSION=1.0.0_5034ed4
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/genomescope2.0/1.0.0_5034ed4/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "genomescope2.0" -v "1.0.0_5034ed4" -w "https://github.com/tbenavi1/genomescope2.0" -d "Reference-free profiling of polyploid genomes" -l "Apache-2.0" -s "misc"
    ./makeroom_genomescope2.0_1.0.0_5034ed4.sh
    cd /sw/bioinfo/genomescope2.0/1.0.0_5034ed4/src
    git clone https://github.com/tbenavi1/genomescope2.0.git
    cd genomescope2.0/
    mkdir $PREFIX/lib

Change the install path and repos in 'install.R'

    Rscript install.R
    mv * $PREFIX/
    cd $TOOLDIR
    vim mf/1.0.0_5034ed4
    ./genomescope2.0-1.0.0_5034ed4_post-install.sh
