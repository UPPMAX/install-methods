genomescope/1.0.0_d2aefdd
========================

<https://github.com/schatzlab/genomescope>

Used under license:
Apache-2.0

Structure creating script (makeroom_genomescope_1.0.0_d2aefdd.sh) moved to /sw/bioinfo/genomescope/makeroom_1.0.0_d2aefdd.sh

LOG
---

    TOOL=genomescope
    VERSION=1.0.0_d2aefdd
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/genomescope/1.0.0_d2aefdd/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "genomescope" -v "1.0.0_d2aefdd" -w "https://github.com/schatzlab/genomescope" -d "Fast genome analysis from unassembled short reads" -l "Apache-2.0" -s "misc"
    ./makeroom_genomescope_1.0.0_d2aefdd.sh
    cd /sw/bioinfo/genomescope/1.0.0_d2aefdd/src
    git clone https://github.com/schatzlab/genomescope.git
    mv * $PREFIX/
    cd $PREFIX
    vim genomescope
    chmod +x genomescope
    ./genomescope-1.0.0_d2aefdd_post-install.sh
