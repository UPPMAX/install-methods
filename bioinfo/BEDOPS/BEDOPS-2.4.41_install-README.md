BEDOPS/2.4.41
=============

<https://bedops.readthedocs.io>

Used under license:
GPL v2


Structure creating script (makeroom_BEDOPS_2.4.41.sh) moved to /sw/bioinfo/BEDOPS/makeroom_2.4.41.sh

LOG
---

It is tempting to try to soften up its use of third-party libraries. Don't do
it. It uses a modded version of zlib, at least.

But we do soften its static linking of everything. They provide statically linked
Linux binaries if you wish.

    TOOL=BEDOPS
    VERSION=2.4.41
    makeroom.sh -f -t "${TOOL}" -v "${VERSION}" -w "https://bedops.readthedocs.io" -l "GPL v2" -d "suite of tools to address common questions raised in genomic studies"
    ./makeroom_BEDOPS_2.4.41.sh 
    source /sw/bioinfo/BEDOPS/SOURCEME_BEDOPS_2.4.41
    cd $SRCDIR
    ml gcc/12.3.0
    wget https://github.com/bedops/bedops/archive/v2.4.41.tar.gz
    tar xf v2.4.41.tar.gz 
    cd bedops-2.4.41/
    sed -i 's/ -static//g' $(grep -r -l -- ' -static' applications)
    make CPPFLAGS="-Wfatal-errors" all

