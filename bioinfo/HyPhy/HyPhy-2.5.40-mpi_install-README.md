HyPhy/2.5.40
============

<http://www.hyphy.org>

Used under license:
Custom open-source 'as is'


Structure creating script (makeroom_HyPhy_2.5.40.sh) moved to /sw/bioinfo/HyPhy/makeroom_2.5.40.sh

LOG
---

Build for miarka and rackham on rackham, build for snowy and bianca on snowy.

    cd /sw/bioinfo/HyPhy
    makeroom.sh "-t" "HyPhy" "-v" "2.5.40" "-w" "http://www.hyphy.org" "-s" "phylogeny" "-l" "Custom open-source 'as is'" "-d" "Open-source software package for the analysis of genetic sequences using techniques in phylogenetics, molecular evolution, and machine learning." "-f"
    ./makeroom_HyPhy_2.5.40.sh
    source SOURCEME_HyPhy_2.5.40 
    cd $VERSIONDIR
    rm -f snowy bianca
    mkdir snowy
    ln -sf snowy bianca

First build on rackham.  Remove existing unpack directory, download bundle if not available.

    cd $SRCDIR
    || -d hyphy-2.5.40 ]] && rm -rf hyphy-2.5.40
    [[ -f ${SRCVERSION}.tar.gz ]] || wget https://github.com/veg/hyphy/archive/${SRCVERSION}.tar.gz
    tar xf 2.5.40.tar.gz

    module load cmake/3.22.2
    module load gcc/11.3.0
    module load openmpi/4.1.3

    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
    make HYPHYMPI
    make install

Now build on snowy.  Remove existing unpack directory.  Build on **snowy-lr1**.

    cd $SRCDIR
    || -d hyphy-2.5.40 ]] && rm -rf hyphy-2.5.40
    [[ -f ${SRCVERSION}.tar.gz ]] || wget https://github.com/veg/hyphy/archive/${SRCVERSION}.tar.gz
    tar xf 2.5.40.tar.gz

    module load cmake/3.22.2
    module load gcc/11.3.0
    module load openmpi/4.1.3
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
    make HYPHYMPI
    make install

