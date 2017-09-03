NGSadmix/32
===========

NGSadmix is "a very nice tool for finding admixture proportions from NGS data."

<http://www.popgen.dk/software/index.php/NgsAdmix>

LOG
---


    VERSION=32
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir NGSadmix
    cd NGSadmix
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd src
    wget http://popgen.dk/software/download/NGSadmix/ngsadmix${VERSION}.cpp
    module load gcc/6.3.0
    g++ ngsadmix${VERSION}.cpp -O3 -lpthread -lz -o NGSadmix
    mv NGSadmix ../$CLUSTER

For the mf file, add `/sw/apps/bioinfo/NGSadmix/$VERSION/$CLUSTER` to `PATH`.

