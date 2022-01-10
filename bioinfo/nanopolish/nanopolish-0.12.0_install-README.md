nanopolish/0.12.0
========================

<https://github.com/jts/nanopolish>

Used under license:
MIT

Structure creating script (makeroom_nanopolish_0.12.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/nanopolish/makeroom_0.12.0.sh

makeroom.sh invoked with:
/home/jonass/uppmax/install-methods/makeroom.sh -t "nanopolish" -w "https://github.com/jts/nanopolish" -d "Software package for signal-level analysis of Oxford Nanopore sequencing data." -v "0.12.0" -s "misc" -l "MIT"

LOG
---

    TOOL=nanopolish
    VERSION=0.12.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/jonass/uppmax/install-methods/makeroom.sh -t "nanopolish" -w "https://github.com/jts/nanopolish" -d "Software package for signal-level analysis of Oxford Nanopore sequencing data." -v "0.12.0" -s "misc" -l "MIT"
    ./makeroom_nanopolish_0.12.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    git clone --recursive https://github.com/jts/nanopolish.git
    cd nanopolish
    make
    cd ..
    cp -avr nanopolish/* ../rackham/

Install VBZ plugin from Oxford Nanopore.

    cd $SRCDIR
    wget https://github.com/nanoporetech/vbz_compression/releases/download/v1.0.1/ont-vbz-hdf-plugin-1.0.1-Linux-x86_64.tar.gz
    tar xf ont-vbz-hdf-plugin-1.0.1-Linux-x86_64.tar.gz 
    cd ont-vbz-hdf-plugin-1.0.1-Linux/usr/local
    cp -av hdf5 $PREFIX

Now set `HDF5_PLUGIN_PATH` to `$modroot/hdf5/lib/plugin` in the mf file.

