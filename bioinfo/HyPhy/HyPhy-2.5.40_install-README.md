HyPhy/2.5.40
========================

<http://www.hyphy.org>

Used under license:
Custom open-source 'as is'


Structure creating script (makeroom_HyPhy_2.5.40.sh) moved to /sw/bioinfo/HyPhy/makeroom_2.5.40.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh "-t" "HyPhy" "-v" "2.5.40" "-w" "http://www.hyphy.org" "-s" "phylogeny" "-l" "Custom open-source 'as is'" "-d" "Open-source software package for the analysis of genetic sequences using techniques in phylogenetics, molecular evolution, and machine learning." "-f"
    ./makeroom_HyPhy_2.5.40.sh
HyPhy/2.5.0-mpi
===============

<http://www.hyphy.org>

Used under license:
Custom open-source 'as is'

A modified copy of the HyPhy/2.5.0 installation procedure, see that install-README for more info.
**Version 2.5.0 must be built before this version is built so we have its SOURCEME file.**  We
don't use makeroom for this version.

This tool tests for some instructions and uses `-march=native` during
compilation.  It requires separate rackham and snowy/bianca/irma executables.

The LIBPATH value (see `hyphy -h`) should already be set correctly by the
installation procedure.

LOG
---

    cd /sw/bioinfo/HyPhy
    source SOURCEME_HyPhy_2.5.0 
    SRCVERSION=$VERSION
    VERSION=${VERSION}-mpi
    [[ -d $VERSION ]] || mkdir $VERSION
    cd $VERSION
    rm -f snowy irma bianca
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca
    mkdir src
    cd src
    [[ -f ${SRCVERSION}.tar.gz ]] || wget https://github.com/veg/hyphy/archive/${SRCVERSION}.tar.gz

We need to remove the snowy/bianca/irma links and create new ones.  See above: we need two sets of executables.  So we need to do the build twice, once on rackham and once on snowy (after ssh snowy-lr1).

    cd /sw/bioinfo/HyPhy
    source SOURCEME_HyPhy_2.5.0 
    SRCVERSION=$VERSION
    VERSION=${VERSION}-mpi
    PREFIX=${PREFIX/$SRCVERSION/$VERSION}
    echo "using version $VERSION"
    echo "using source version $SRCVERSION"
    echo "using prefix $PREFIX"
    [[ -d $VERSION ]] || mkdir $VERSION
    cd $VERSION
    module load cmake/3.13.2
    module load gcc/7.4.0
    module load openmpi/3.1.3
    cd src
    [[ -d hyphy-${SRCVERSION} ]] && rm -rf hyphy-${SRCVERSION}
    tar xzf ${SRCVERSION}.tar.gz
    cd hyphy-$SRCVERSION
    if [[ $CLUSTER == snowy ]] ; then  # change PREFIX value set in SOURCEME
        PREFIX=${PREFIX/rackham/snowy}
    fi
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
    make HYPHYMPI
    make install

