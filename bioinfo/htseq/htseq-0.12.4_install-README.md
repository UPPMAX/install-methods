htseq/0.12.4
========================

<https://htseq.readthedocs.io>

Used under license:
GPL v3

Structure creating script (makeroom_htseq_0.12.4.sh) moved to /sw/bioinfo/htseq/makeroom_0.12.4.sh

LOG
---

    TOOL=htseq
    VERSION=0.12.4
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "$TOOL" -v "${VERSION}" -s "misc" -w "https://htseq.readthedocs.io" -d "Analysing high-throughput sequencing data with Python" -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load python/3.7.2
    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install htseq==$VERSION
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/htseq* .

    module purge
    ldd $(head -1 * | grep '^#!' | cut -c3-)


    ./${TOOL}-${VERSION}_post-install.sh

Make sure it is htseq 0.12.4 being installed.  This will also install `pysam`
and a couple other things.

For the mf file, add `$PREFIX/bin` to `PATH`. This should be all that is required.

