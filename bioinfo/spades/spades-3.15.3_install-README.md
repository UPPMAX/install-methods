spades/3.15.3
========================

<http://cab.spbu.ru/software/spades/>

Used under license:
GPLv2
<https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>

Structure creating script (makeroom_spades_3.15.3.sh) moved to /sw/bioinfo/spades/makeroom_3.15.3.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "spades" -v "3.15.3" -s "assembly" -w "http://cab.spbu.ru/software/spades/" -l "GPLv2" -L "https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html" -d "SPAdes --  St. Petersburg genome assembler -- is an assembly toolkit containing various assembly pipelines." -f
    ./makeroom_spades_3.15.3.sh


    TOOL=spades
    VERSION=3.15.3
    cd $SRCDIR
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
