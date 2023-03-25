MAJIQ/2.4.dev4+gdd436123
========================

<http://>

Used under license:
Custom non-commercial
<https://majiq.biociphers.org/Academic_License.txt>

Structure creating script (makeroom_MAJIQ_2.4.dev4+gdd436123.sh) moved to /sw/bioinfo/MAJIQ/makeroom_2.4.dev4+gdd436123.sh

LOG
---

We didn't know the version, so we first installed into version Unknown, determined the version, and then re-makeroom-d with the known version.


    makeroom.sh -t MAJIQ -v '2.4.dev4+gdd436123' -c bioinfo -s annotation -d "MAJIQ and Voila are two software packages that together detect, quantify, and visualize local splicing variations (LSV) from RNA-Seq data" -l "Custom non-commercial" -L https://majiq.biociphers.org/Academic_License.txt
    ./makeroom_MAJIQ_2.4.dev4+gdd436123.sh 
    source /sw/bioinfo/MAJIQ/SOURCEME_MAJIQ_2.4.dev4+gdd436123
    cd $SRCDIR

We install within a venv, so change to PREFIX.

    cd $PREFIX

    ml git/2.34.1
    ml python/3.9.5
    ml bioinfo-tools
    ml htslib/1.17
    virtualenv $PREFIX/venv
    export HTSLIB_LIBRARY_DIR=$HTSLIB_ROOT/lib
    export HTSLIB_INCLUDE_DIR=$HTSLIB_ROOT/include
    $PREFIX/venv/bin/pip install git+https://bitbucket.org/biociphers/majiq_academic.git

    ll venv/bin/
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/majiq .
    ln -s $PREFIX/venv/bin/voila .
    ./majiq --help
    ./majiq -v

