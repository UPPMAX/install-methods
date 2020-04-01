MACS/2.2.6
========================

<https://taoliu.github.io/MACS/>
<https://github.com/taoliu/MACS>

Used under license:
BSD 3-clause

Structure creating script (makeroom_MACS_2.2.6.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MACS/makeroom_2.2.6.sh

LOG
---

    TOOL=MACS
    VERSION=2.2.6
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -d "Model-based Analysis of ChIP-Seq" -w https://taoliu.github.io/MACS/ -l "BSD 3-clause"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load python/3.7.2
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages
    pip3 install --target=$PREFIX MACS2==2.2.6

