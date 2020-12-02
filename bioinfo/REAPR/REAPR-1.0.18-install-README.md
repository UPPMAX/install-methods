REAPR/1.0.18
============

<http://www.sanger.ac.uk/science/tools/reapr>

LOG
---

    TOOL=/sw/apps/bioinfo/REAPR
    VERSION=1.0.18
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f Reapr_${VERSION}.tar.gz ]] || wget ftp://ftp.sanger.ac.uk/pub/resources/software/reapr/Reapr_${VERSION}.tar.gz
    rm -rf Reapr_1.0.18/
    tar xzf Reapr_${VERSION}.tar.gz
    cd Reapr_1.0.18/

    module load gcc/5.4.0
    module load perl_modules/5.24.1

    ./install.sh 
    cd ..
    mv Reapr_1.0.18 ../$CLUSTER

Turns out perl_modules/5.24.1 was not part of the module file.

