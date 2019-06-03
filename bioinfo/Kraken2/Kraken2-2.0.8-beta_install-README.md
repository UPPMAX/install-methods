Kraken2/2.0.8-beta
==================

<https://ccb.jhu.edu/software/kraken2/>

Used under license:
MIT

LOG
---

    TOOL=Kraken2
    VERSION=2.0.8-beta
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Kraken2_2.0.8-beta.sh

Structure creating script (makeroom_Kraken2_2.0.8-beta.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Kraken2/makeroom_2.0.8-beta.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    [[ -f v${VERSION}.tar.gz ]] || wget --timestamping https://github.com/DerrickWood/kraken2/archive/v${VERSION}.tar.gz
    [[ -d kraken2-$VERSION ]] && rm -rf kraken2-$VERSION
    tar xvzf v${VERSION}.tar.gz
    cd kraken2-$VERSION
    module load gcc/6.3.0
    ./install_kraken2.sh $PREFIX
    cd ..
    [[ -d kraken2-$VERSION ]] && rm -rf kraken2-$VERSION
    cd $PREFIX

Check that all the perl scripts have proper `#!` lines.  They do.  Also check
that all required modules are included in the system perl.  They are.  These
should perform fine whether system perl or a module perl is used.

    grep -h '^use ' *.pl kraken2* | sort -Vu
    head -n 1 *.sh *.pl kraken2* | grep perl

Check the executables, that RPATH is saved.

    module unload gcc
    file build_db
    ldd build_db

Now to update how Kraken2 databases are built.

