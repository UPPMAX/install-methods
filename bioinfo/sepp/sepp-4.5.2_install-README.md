sepp/4.5.2
========================

<https://github.com/smirarab/sepp>

Used under license:
GPL v3


Structure creating script (makeroom_sepp_4.5.2.sh) moved to /sw/bioinfo/sepp/makeroom_4.5.2.sh

LOG
---

    makeroom.sh "-f" "-t" "sepp" "-v" "4.5.2" "-w" "https://github.com/smirarab/sepp" "-l" "GPL v3" "-d" "SEPP stands for SATe-enabled Phylogenetic Placement\, and addresses the problem of phylogenetic placement of short reads into reference alignments and trees."
    ./makeroom_sepp_4.5.2.sh

    source /sw/bioinfo/sepp/SOURCEME_sepp_4.5.2
    cd $SRCDIR

    ml git/2.34.1
    ml python/3.11.8
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

    git clone --recursive https://github.com/smirarab/sepp
    ml -git
    cd sepp
    pip3 install .

Now create symlinks in $PREFIX/bin for venv scripts.

    cd $PREFIX
    mkdir bin
    cd bin
    for EXEC in run_sepp.py run_upp.py split_sequences.py sumlabels.py sumtrees.py ; do
        ln -sf $(which $EXEC) .
    done

Copy the jar here.

    cp -av $SRCDIR/sepp-4.5.2/tools/merge/seppJsonMerger.jar .

Copy the config here into `bin/` and reset the paths.

    cp -av $SRCDIR/sepp-4.5.2/.sepp/main.config .

Within `main.config` set the pplacer hmmalign hmmsearch hmmbuild paths to

    which pplacer
    which hmmalign
    which hmmsearch
    which hmmbuild

and set the jsonmerger path to its location within bin:

    ls -1 $PREFIX/bin/seppJsonMerger.jar

Then we need to tell it where to find main.config by placing `$PREFIX/bin` within `home.path`.

    cd $PREFIX
    find . -name home.path
    vi ./rackham/venv/home.path

After wrapping up, this is not where home.path was expected.

    cd $TOOLDIR
    ./sepp-4.5.2_post-install.sh
    ml bioinfo-tools
    ml sepp/4.5.2
    run_sepp.py

So move it.

    source SOURCEME_sepp_4.5.2
    cd $PREFIX/venv/
    mv home.path $PREFIX/venv/lib/python3.11/site-packages/

This should now work.

    run_sepp.py
    run_sepp.py -h
