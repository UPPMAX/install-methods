MAFFT/7.407
===========

MAFFT multiple alignment software

<http://mafft.cbrc.jp/alignment/software/>


LOG
---

Manage the prefix by setting the `PREFIX` make variable on the command line.


    VERSION=7.407
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/MAFFT
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f mafft-${VERSION}-with-extensions-src.tgz ]] || wget http://mafft.cbrc.jp/alignment/software/mafft-${VERSION}-with-extensions-src.tgz
    tar xzf mafft-${VERSION}-with-extensions-src.tgz
    cd mafft-${VERSION}-with-extensions
    module load gcc/6.3.0
    cd core
    make PREFIX=$PFX && make PREFIX=$PFX install
    cd ../extensions
    make PREFIX=$PFX && make PREFIX=$PFX install

The mf file should have `$PFX/bin` (`$modroot/bin`) to `PATH` and
`$PFX/share/man` (`$modroot/share/man`) to `MANPATH`.

