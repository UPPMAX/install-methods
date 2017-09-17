

### For installation on kalkyl ###

Logged in on biologin.uppmax.uu.se

Downloaded the source code:

    wget http://bedtools.googlecode.com/files/BEDTools.v2.16.2.tar.gz

Unpack:

    tar xvfz BEDTools.v2.16.2.tar.gz

Loaded gcc compiler:

    module load gcc/4.4

Followed the instruction in the README.rst:

    cd BEDTools-Version-2.16.2
    make clean
    make all

    mkdir /sw/apps/bioinfo/BEDTools/2.16.2/kalkyl/
    cp -R bin /sw/apps/bioinfo/BEDTools/2.16.2/kalkyl/

