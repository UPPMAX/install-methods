EPA-ng/0.3.8
========================

<https://github.com/Pbdas/epa-ng>

Used under license:
GNU3.0
<>

Structure creating script (makeroom_EPA-ng_0.3.8.sh) moved to /sw/bioinfo/EPA-ng/makeroom_0.3.8.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "EPA-ng" -v "0.3.8" -s "annotation" -d "EPA-ng is a complete rewrite of the Evolutionary Placement Algorithm EPA\, previously implemented in RAxML" -w "https://github.com/Pbdas/epa-ng" -l "GNU3.0"
    ./makeroom_EPA-ng_0.3.8.sh
    TOOL=EPA-ng
    version=0.3.8
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_$version

    module load gcc/9.3.0
    module load cmake/3.17.3

    cd $SRCDIR
    wget https://github.com/Pbdas/epa-ng/archive/refs/tags/v0.3.8.tar.gz 
    tar xfvz v0.3.8.tar.gz --strip=1 && rm v0.3.8.tar.gz
    make -j 15

    cp bin/epa-ng $PREFIX
    
    





