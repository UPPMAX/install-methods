mirdeep2/2.0.1.3-20220221-c6440e2
=================================

<https://github.com/rajewsky-lab/mirdeep2>

Used under license:
GPL v3


Structure creating script (makeroom_mirdeep2_2.0.1.3-20220221-c6440e2.sh) moved to /sw/bioinfo/mirdeep2/makeroom_2.0.1.3-20220221-c6440e2.sh

The installation procedure is much more simple if the tools are already found locally.

LOG
---

    makeroom.sh -f -t mirdeep2 -v 2.0.1.3-20220221-c6440e2 -l "GPL v3" -d "Discovering known and novel miRNAs from small RNA sequencing data" -w https://github.com/rajewsky-lab/mirdeep2
    ./makeroom_mirdeep2_2.0.1.3-20220221-c6440e2.sh 

    source /sw/bioinfo/mirdeep2/SOURCEME_mirdeep2_2.0.1.3-20220221-c6440e2

    cd $SRCDIR

For building.

    ml git/2.34.1
    ml gcc/6.3.0

Prerequisites.

    ml perl/5.26.2
    ml perl_modules/5.26.2
    ml bioinfo-tools
    ml ViennaRNA/2.4.17
    ml bowtie/1.2.3
    ml randfold/2.0.1
    ml squid/1.9g


    git clone --recursive https://github.com/rajewsky-lab/mirdeep2
    cd mirdeep2/
    git reset --hard c6440e2

    mkdir $PREFIX/bin/

    cd src
    head -n 1 *.pl

We will adjust the `#!` lines after installing.

    cp -av * $PREFIX/bin/
    cd $PREFIX/bin
    sed -i '1i#!/usr/bin/env perl' *.pl
    head -n 1 *.pl

Now place `Rfam_for_miRDeep.fa` and `install_successful`, two files that must be found in parent directory of scripts.

    cd $SRCDIR/mirdeep2
    cp -av Rfam_for_miRDeep.fa $PREFIX/
    cd $PREFIX
    touch install_successful

Now test.

    OPATH=$PATH
    export PATH=$PREFIX/bin:$PATH
    cd $SRCDIR
    cd mirdeep2/tutorial_dir

    ./run_tut.sh 

    export PATH=$OPATH
    unset OPATH

Wrap up.

    cd $TOOLDIR
    ./mirdeep2-2.0.1.3-20220221-c6440e2_post-install.sh

