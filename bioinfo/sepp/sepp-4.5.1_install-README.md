sepp/4.5.1
========================

<https://github.com/smirarab/sepp>

Used under license:
GPL v3


Structure creating script (makeroom_sepp_4.5.1.sh) moved to /sw/bioinfo/sepp/makeroom_4.5.1.sh

LOG
---

    makeroom.sh "-f" "-t" "sepp" "-v" "4.5.1" "-w" "https://github.com/smirarab/sepp" "-l" "GPL v3" "-d" "SEPP stands for SATe-enabled Phylogenetic Placement\, and addresses the problem of phylogenetic placement of short reads into reference alignments and trees."
    ./makeroom_sepp_4.5.1.sh
    source /sw/bioinfo/sepp/SOURCEME_sepp_4.5.1
    cd $SRCDIR
    ml git/2.34.1
    ml python/3.11.4
    ml gcc/12.3.0
    ml bioinfo-tools
    ml pplacer/1.1.alpha19
    ml hmmer/3.3.2

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    ml -python
    which python

    cd $SRCDIR

    wget https://github.com/smirarab/sepp/archive/refs/tags/4.5.1.tar.gz
    tar xf 4.5.1.tar.gz
    cd sepp-4.5.1
    pip3 install .

Now create symlinks in $PREFIX/bin for venv scripts.

    cd $PREFIX
    mkdir bin
    cd bin
    for EXEC in run_sepp.py run_upp.py split_sequences.py sumlabels.py sumtrees.py ; do
        ln -sf $(which $EXEC) .
    done

Copy the jar here.

    cp -av $SRCDIR/sepp-4.5.1/tools/merge/seppJsonMerger.jar .

Copy the config here and reset the paths.

./src/sepp-4.5.1/tools/merge/seppJsonMerger.jar

    cp -av $SRCDIR/sepp-4.5.1/.sepp/main.config .

Within `main.config` set the pplacer hmmalign hmmsearch hmmbuild paths to

    which pplacer
    which hmmalign
    which hmmsearch
    which hmmbuild

and set the jsonmerger path to its location within bin:

    ls -1 $PREFIX/bin/seppJsonMerger.jar

Then we need to tell it where to find main.config.
