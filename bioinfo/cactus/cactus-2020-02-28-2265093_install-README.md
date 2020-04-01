cactus/2020-02-28-2265093
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
MIT

Structure creating script (makeroom_cactus_2020-02-28-2265093.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/cactus/makeroom_2020-02-28-2265093.sh

LOG
---

    TOOL=cactus
    VERSION=2020-02-28-2265093
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_cactus_2020-02-28-2265093.sh

    source /sw/bioinfo/cactus/SOURCEME_cactus_2020-02-28-2265093 
    cd $PREFIX
    python3 -m pip install --upgrade --target $PREFIX/target virtualenv
    PATH=$PATH:$PREFIX/target/bin
    virtualenv -p python3.6 cactus_env
    source cactus_env/bin/activate
    pip install --upgrade toil[all]
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd cactus
    pip install --upgrade .

    singularity pull -F docker://quay.io/comparative-genomics-toolkit/cactus:30682864ff2331d25f3b12f54b5fd37b46dbc946
