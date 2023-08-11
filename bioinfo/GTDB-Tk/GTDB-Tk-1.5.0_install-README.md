GTDB-Tk/1.5.0
========================

<https://ecogenomics.github.io/GTDBTk/installing/index.html#installing-gtdb-tk>

Used under license:
GPLv3
<>

Structure creating script (makeroom_GTDB-Tk_1.5.0.sh) moved to /sw/bioinfo/GTDB-Tk/makeroom_1.5.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "GTDB-Tk" -v "1.5.0" -w "https://ecogenomics.github.io/GTDBTk/installing/index.html#installing-gtdb-tk" -l "GPLv3" -f
    ./makeroom_GTDB-Tk_1.5.0.sh
    TOOL=GTDB-Tk
    version=1.5.0
    cd /sw/bioinfo/$TOOL
    source SOURCEME_GTDB-Tk_$version

    module load bioinfo-tools
    module load prodigal/2.6.3
    module load hmmer/3.2.1
    module load pplacer/1.1.alpha19
    module load FastTree/2.1.10
    module load FastANI/1.33
    module load mash/2.3
    module load python/3.8.7

    PYTHONUSERBASE=$PREFIX python -m pip --user install gtdbtk

Or possibly:

    cd $SRCDIR
    wget https://github.com/Ecogenomics/GTDBTk/archive/refs/tags/1.5.0.tar.gz
    tar xfvz 1.5.0.tar.gz --strip=1 && rm 1.5.0.tar.gz
    PYTHONUSERBASE=PREFIX python -m pip install --user .

