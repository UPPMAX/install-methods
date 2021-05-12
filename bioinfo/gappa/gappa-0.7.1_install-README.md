gappa/0.7.1
========================

<https://github.com/lczech/gappa>

Used under license:
GNU3.0
<>

Structure creating script (makeroom_gappa_0.7.1.sh) moved to /sw/bioinfo/gappa/makeroom_0.7.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "gappa" -v "0.7.1" -d "gappa is a collection of commands for working with phylogenetic data. Its main focus are evolutionary placements of short environmental sequences on a reference phylogenetic tree." -l "GNU3.0" -s "annotation" -w "https://github.com/lczech/gappa"
    ./makeroom_gappa_0.7.1.sh
    TOOL=gappa
    version=0.7.1
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_$version

    module load gcc/9.3.0
    module load cmake/3.17.3

    cd $SRCDIR
    wget https://github.com/lczech/gappa/archive/refs/tags/v0.7.1.tar.gz
    tar xfvz v0.7.1.tar.gz --strip=1 && rm v0.7.1.tar.gz
    cp bin/gappa $PREFIX


