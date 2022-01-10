RAxML-NG/1.1.0
==============

<https://github.com/amkozlov/raxml-ng>

Used under license:
GNU AGPL 3.0


Structure creating script (makeroom_RAxML-NG_1.1.0.sh) moved to /sw/bioinfo/RAxML-NG/makeroom_1.1.0.sh

LOG
---

For the non-MPI version, use the statically-linked precompiled version.

    makeroom.sh -f -t RAxML-NG -v 1.1.0 -d "a phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion" -w https://github.com/amkozlov/raxml-ng -l "GNU AGPL 3.0"
    ./makeroom_RAxML-NG_1.1.0.sh 
    source /sw/bioinfo/RAxML-NG/SOURCEME_RAxML-NG_1.1.0 && cd $SRCDIR
    wget https://github.com/amkozlov/raxml-ng/releases/download/1.1.0/raxml-ng_v1.1.0_linux_x86_64.zip
    unzip raxml-ng_v1.1.0_linux_x86_64.zip 

Be sure this is statically linked:

    ldd raxml-ng

If so, install:

    mkdir $PREFIX/bin
    cp -av raxml-ng $PREFIX/bin/

All the mf file needs is to add $modroot/bin to the PATH.
