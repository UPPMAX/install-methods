GTDB-Tk/0.3.2
========================

<https://github.com/Ecogenomics/GTDBTk>

Used under license:
GPL v3

Structure creating script (makeroom_GTDB-Tk_0.3.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/GTDB-Tk/makeroom_0.3.2.sh

LOG
---

    makeroom.sh -t GTDB-Tk -v 0.3.2 -s misc -d "software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes" -w https://github.com/Ecogenomics/GTDBTk -l "GPL v3"
    ./makeroom_GTDB-Tk_0.3.2.sh 
    cd /sw/bioinfo/GTDB-Tk/
    source SOURCEME_GTDB-Tk_0.3.2 

    ml python/2.7.15

    PYTHONUSERBASE=$PREFIX pip install --user gtdbtk

    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages
    export PATH=$PREFIX/bin:$PATH

    gtdbtk -h

