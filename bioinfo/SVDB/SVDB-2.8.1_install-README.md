SVDB/2.8.1
========================

<https://github.com/J35P312/SVDB>

Used under license:
MIT


Structure creating script (makeroom_SVDB_2.8.1.sh) moved to /sw/bioinfo/SVDB/makeroom_2.8.1.sh

LOG
---

    makeroom.sh "-f" "-t" "SVDB" "-v" "2.8.1" "-s" "misc" "-l" "MIT" "-w" "https://github.com/J35P312/SVDB" "-d" "toolkit for constructing and querying structural variant databases"
    ./makeroom_SVDB_2.8.1.sh
    cd $SRCDIR
    wget https://github.com/J35P312/SVDB/archive/refs/tags/2.8.1.tar.gz
    tar xvf 2.8.1.tar.gz
    cd SVDB-2.8.1

    module load python/3.9.5
    python3 -m venv --upgrade-deps $PREFIX/venv
    source  $PREFIX/venv/bin/activate
    python3 -m pip install -e .
    cd $PREFIX
    mkdir bin && cd bin
    ln -s ../venv/bin/svdb



