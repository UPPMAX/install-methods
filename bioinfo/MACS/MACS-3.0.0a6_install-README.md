MACS/3.0.0a6
========================

<https://macs3-project.github.io/MACS/>

Used under license:
BSD 3-clause


Structure creating script (makeroom_MACS_3.0.0a6.sh) moved to /sw/bioinfo/MACS/makeroom_3.0.0a6.sh

LOG
---

    VERSION=3.0.0a6
    makeroom.sh -f -t "MACS" -v "${VERSION}" -s "misc" -d "Model-based Analysis of ChIP-Seq" -w "https://macs3-project.github.io/MACS/" -l "BSD 3-clause"
    ./makeroom_MACS_${VERSION}.sh

    source SOURCEME_MACS_${VERSION}

    module load python/3.7.2
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages
    pip3 install --target=$PREFIX MACS3==${VERSION}

