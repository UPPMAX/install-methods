CONCOCT/1.1.0
========================

<https://github.com/BinPro/CONCOCT>

Used under license:
FreeBSD

Structure creating script (makeroom_CONCOCT_1.1.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/CONCOCT/makeroom_1.1.0.sh

LOG
---

    TOOL=CONCOCT
    VERSION=1.1.0
    mkdir -p /sw/bioinfo/$TOOL
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -s "misc" -t "${TOOL}" -v "${VERSION}" -w "https://github.com/BinPro/CONCOCT" -l "FreeBSD" -d "Clustering cONtigs with COverage and ComposiTion"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}


    cd $VERSIONDIR/src

    wget https://github.com/BinPro/CONCOCT/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    cd ${TOOL}-${VERSION}

    module load python/3.7.2
    module load bioinfo-tools
    module load BEDTools/2.27.1
    module load samtools/1.8
    module load MUMmer/3.23

    mkdir -p $PREFIX/lib/python3.7/site-packages
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages:PYTHONPATH
    python setup.py install --prefix $PREFIX

Now move over the `scripts/` directory, not normally included, and convert some
hash-bang lines for perl and R scripts.

    cp -av scripts $PREFIX/
    cd $PREFIX/scripts
    sed -i 's,usr/bin/perl.*$,usr/bin/env perl,' *.pl
    sed -i 's,usr/bin/Rscript.*$,usr/bin/env Rscript,' *.R

Make sure `$modroot/scripts` is in the path.
