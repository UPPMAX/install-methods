purge_dups/1.2.6
================

<https://github.com/dfguan/purge_dups>

Used under license:
MIT


Structure creating script (makeroom_purge_dups_1.2.6.sh) moved to /sw/bioinfo/purge_dups/makeroom_1.2.6.sh

LOG
---

    makeroom.sh -f -t purge_dups -v 1.2.6 -s assembly -w https://github.com/dfguan/purge_dups -l MIT -d "Purge haplotigs and overlaps in an assembly based on read depth"
    ./makeroom_purge_dups_1.2.6.sh 
    source /sw/bioinfo/purge_dups/SOURCEME_purge_dups_1.2.6

    cd $PREFIX

    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate

Make sure these are from the virtualenv.

    which pip
    which python

Now install parts and purge_dups.

    cd $SRCDIR

    ml git/2.34.1

    wget https://github.com/dfguan/purge_dups/archive/refs/tags/v1.2.6.tar.gz
    git clone https://github.com/dfguan/KMC
    git clone https://github.com/dfguan/runner

    ml gcc/12.3.0
    ml zlib/1.2.12
    ml bioinfo-tools
    ml minimap2/2.26-r1175

Build and install runner and author's KMC clone.

    cd $SRCDIR
    cd runner/
    pip install .

    cd $SRCDIR
    cd KMC/
    make -j10
    pip install .

    mkdir $PREFIX/bin
    cp -av bin/* $PREFIX/bin/

Now install purge_dups.

    tar xf v1.2.6.tar.gz 
    cd purge_dups-1.2.6/
    cd src
    make
    cd ..
    ( ml purge ; ldd bin/* )
    cp -av bin/* $PREFIX/bin/

Bring `scripts/` under PREFIX and have it use the virtualenv python.

    cp -av scripts $PREFIX/
    cd $PREFIX/scripts
    sed -i -e '1i#!'$(which python) *.py

Make sure we have in module help that the `run_busco`, `run_busco2` and
`run_kmc` scripts will not work.

Decided to install the latest official KMC.

Wrap things up.

    ./purge_dups-1.2.6_post-install.sh 
