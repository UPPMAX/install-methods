Logged in on biologin.uppmax.uu.se

Downloaded the latest version at: http://code.google.com/p/bedtools/ to my glob folder.

    cd glob

Loaded gcc:

    module load gcc/4.4

Check modules loaded:

    module list
    Currently Loaded Modulefiles:
      1) uppmax          2) bioinfo-tools   3) gcc/4.4

Unpacked:

    gunzip BEDTools.v2.11.2.tar.gz
    tar xvf BEDTools.v2.11.2.tar

    cd BEDTools-Version-2.11.2

Followed the instruction in the README.rst:

    make clean
    make all

    mkdir /sw/apps/bioinfo/BEDTools/2.11.2_kalkyl_gcc/
    cp -R bin /sw/apps/bioinfo/BEDTools/2.11.2_kalkyl_gcc/

