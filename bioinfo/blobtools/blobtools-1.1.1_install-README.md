blobtools/1.1.1
========================

<https://github.com/DRL/blobtools>

Used under license:
GPL v3.0

Structure creating script (makeroom_blobtools_1.1.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/blobtools/makeroom_1.1.1.sh

LOG
---

    makeroom.sh -f -t blobtools -v 1.1.1 -s misc -w https://github.com/DRL/blobtools -l 'GPL v3.0' -d 'modular command-line solution for visualisation, quality control and taxonomic partitioning of genome datasets'
    ./makeroom_blobtools_1.1.1.sh
    cd /sw/bioinfo/blobtools
    source SOURCEME_blobtools_1.1.1
    cd $VERSIONDIR
    cd src
    wget https://github.com/DRL/blobtools/archive/blobtools_v${VERSION}.tar.gz
    tar xzf blobtools_v${VERSION}.tar.gz
    cd blobtools-blobtools_v${VERSION}
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip3 install --user pysam pyyaml>=4.2b1 tqdm docopt matplotlib
    PYTHONUSERBASE=$PREFIX python3 setup.py install --user
    cp -av blobtools $PREFIX/
    cp -av lib/* $PREFIX/lib/

Now build a default NCBI taxonomy library with the latest UPPMAX download.  I
have also updated the 'module help' to show users how to do this for
themselves.  Many months ago a pull request of mine to add this to blobtools
was accepted, so we might as well use it!

    module load blobtools/$VERSION
    cd $BLOBTOOLS_ROOT
    mkdir data
    blobtools nodesdb --nodes /sw/data/uppnex/ncbi_taxonomy/latest/nodes.dmp --names /sw/data/uppnex/ncbi_taxonomy/latest/names.dmp

