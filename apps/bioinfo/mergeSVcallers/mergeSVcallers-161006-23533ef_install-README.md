mergeSVcallers/161006-23533ef
========================

<https://github.com/zeeev/mergeSVcallers>

LOG
---

It makes some weird segfault when executing empty.
I did..

    TOOL=mergeSVcallers
    VERSION=161006-23533ef
    CLUSTER=milou
    /home/jonass/uppmax/bin/makeroom.sh -t $TOOL -v $VERSION -s misc
    ./makeroom_mergeSVcallers_161006-23533ef.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/zeeev/mergeSVcallers.git
    cd mergeSVcallers/
    make
    mkdir -p /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin
    cp -av mergeSVcallers /sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER/bin/
