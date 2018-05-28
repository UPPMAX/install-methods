satsuma2/2016-12-07
===================

<https://github.com/bioinfologics/satsuma2>


LOG
---

    VERSION=2016-12-07
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/satsuma2
    cd /sw/apps/bioinfo/satsuma2
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    [[ -d satsuma2 ]] || git clone https://github.com/bioinfologics/satsuma2
    cd satsuma2
    module load cmake/3.5.1
    module load gcc/6.3.0
    cmake .
    make
    cp -av bin $PFX/

