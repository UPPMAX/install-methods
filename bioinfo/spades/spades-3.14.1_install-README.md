spades/3.14.1
========================

<http://cab.spbu.ru/software/spades/>

Used under license:
GPLv2
<https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>

Structure creating script (makeroom_spades_3.14.1.sh) moved to /sw/bioinfo/spades/makeroom_3.14.1.sh

LOG
---

    TOOL=spades
    VERSION=3.14.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/spades/3.14.1/src
    /home/laekl991/scripts/install-methods/makeroom.sh -t "spades" -v "3.14.1" -s "assembly" -w "http://cab.spbu.ru/software/spades/" -l "GPLv2" -L "https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html" -d "SPAdes\" --  St. Petersburg genome assembler\" -- is an assembly toolkit containing various assembly pipelines." -f"
    ./makeroom_spades_3.14.1.sh
spades/3.13.1
=============

Flexible and accurate assembler with scaling that favours primarily small
genomes.

    <http://cab.spbu.ru/software/spades/>

This is a new website for SPAdes.

Log
---

    VERSION=3.13.1
    cd /sw/bioinfo
    mkdir -p spades
    cd spades
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://cab.spbu.ru/files/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz
    tar xzf SPAdes-${VERSION}-Linux.tar.gz 
    cd SPAdes-${VERSION}-Linux/
    cd bin/

Check for shared objects.

    ldd *

None.  Note that spades_init.py is a locally-used package and need not be executable.

Check `#!` lines of python scripts.  Not needed here.

    head -n 1 *.py

Move `bin` and `share` to cluster directory.

    cd ..
    mv bin share ${PREFIX}/
    cd ..
    rmdir SPAdes-${VERSION}-Linux/

The mf file from previous versions should work.
