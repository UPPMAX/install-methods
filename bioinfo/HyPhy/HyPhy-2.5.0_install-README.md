HyPhy/2.5.0
===========

<http://www.hyphy.org>

Used under license:
Custom open-source 'as is'

Structure creating script (makeroom_HyPhy_2.5.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/HyPhy/makeroom_2.5.0.sh

This tool tests for some instructions and uses `-march=native` during compilation.  It requires separate rackham and snowy/bianca/irma executables.

LOG
---

    makeroom.sh -t HyPhy -v 2.5.0 -w http://www.hyphy.org -s phylogeny -l "Custom open-source 'as is'" -d "Open-source software package for the analysis of genetic sequences using techniques in phylogenetics, molecular evolution, and machine learning." 
    ./makeroom_HyPhy_2.5.0.sh
    cd /sw/bioinfo/HyPhy
    source SOURCEME_HyPhy_2.5.0 
    cd $VERSION
    rm -f snowy irma bianca
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca
    mkdir src
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/veg/hyphy/archive/${VERSION}.tar.gz

We need to remove the snowy/bianca/irma links and create new ones.  See above: we need two sets of executables.  So we need to do the build twice, once on rackham and once on snowy (after ssh snowy-lr1).

    cd /sw/bioinfo/HyPhy
    source SOURCEME_HyPhy_2.5.0 
    cd $VERSION
    module load cmake/3.13.2
    module load gcc/7.4.0
    [[ -d hyphy-${VERSION} ]] && rm -rf hyphy-${VERSION}
    tar xzf ${VERSION}.tar.gz
    cd hyphy-$VERSION
    if [[ $CLUSTER == snowy ]] ; then  # PREFIX from the SOURCEME file is ok
        PREFIX=${PREFIX/rackham/snowy}
    fi
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
    make install
