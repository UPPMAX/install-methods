humann2/0.11.2
========================

<http://huttenhower.sph.harvard.edu/humann2>

LOG
---

I did..

    TOOL=humann2
    VERSION=0.11.2
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom.sh

NOTE: I use  script which is located at /sw/apps/bioinfo/humann2/makeroom_0.11.2.sh

    ./makeroom_humann2_0.11.2.sh
    cd /sw/apps/bioinfo/humann2/
    cd 0.11.2/
    cd rackham/
    PFX=$PWD
    PYTHONUSERBASE=$PFX pip install humann2 --install-option='--bypass-dependencies-install' --user
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    mkdir /sw/mf/common/bioinfo-tools/misc/humann2/
    cp ../mf/0.11.2 /sw/mf/common/bioinfo-tools/misc/humann2/
    all_mflink -f  humann2 0.11.2
    rm  -rf /sw/mf/milou/bioinfo-tools/misc/humann2
    ml humann2
    humann2_test
    cd cd /sw/apps/bioinfo/humann2/
    mkdir data
    cd data
    export DIR=$PWD
    humann2_databases --download chocophlan full $DIR
    humann2_databases --download uniref uniref90_diamond $DIR 
    humann2_databases --download utility_mapping full $DIR

