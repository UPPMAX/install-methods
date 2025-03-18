pbwt/2.1
========================

<https://github.com/richarddurbin/pbwt>

Used under license:



Structure creating script (makeroom_pbwt_2.1.sh) moved to /sw/bioinfo/pbwt/makeroom_2.1.sh

LOG
---

    /crex/proj/staff/pmitev/nobackup/GIT/install-methods/makeroom.sh "-t" "pbwt" "-v" "2.1" "-w" "https://github.com/richarddurbin/pbwt" "-d" "The pbwt package provides a core implementation and development environment for PBWT (Positional Burrows-Wheeler Transform) methods for storing and computing on genome variation data sets." "-c" "bioinfo" "-s" "misc"
    ./makeroom_pbwt_2.1.sh
    cd $SRCDIR
    wget https://github.com/richarddurbin/pbwt/archive/refs/tags/v2.1.tar.gz
    tar xvf v2.1.tar.gz
    cd pbwt-2.1
    module load bioinfo-tools gcc/14.2.0 htslib/1.20
    # Edit the makefile
    make
    cd $PREFIX
    ln -s $SRCDIR/pbwt-2.1/pbwt


