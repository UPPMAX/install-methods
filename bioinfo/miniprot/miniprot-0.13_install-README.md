miniprot/0.13
========================

<https://github.com/lh3/miniprot>

Used under license:
MIT


Structure creating script (makeroom_miniprot_0.13.sh) moved to /sw/bioinfo/miniprot/makeroom_0.13.sh

Edits and rebuild later by Douglas. Need separate snowy build.

LOG
---

    makeroom.sh -f "-t" "miniprot" "-v" "0.13" -w "https://github.com/lh3/miniprot" "-d" "Align proteins to genomes with splicing and frameshift" "-l" "MIT" "-s" "alignment"
    ./makeroom_miniprot_0.13.sh
    source /sw/bioinfo/miniprot/SOURCEME_miniprot_0.13
    cd $SRCDIR

    # Load modules
    module load gcc/12.3.0
    module load zlib/1.3

    # Download
    wget https://github.com/lh3/miniprot/releases/download/v0.13/miniprot-0.13.tar.bz2
    tar xf miniprot-0.13.tar.bz2
    cd miniprot-0.13

This includes a fix for non-SSE4.2 machines. SO we compile separately on snowy.

On rackham5:

    make clean
    make 
    mkdir $PREFIX/bin
    mkdir -p $PREFIX/share/man/man1
    cp -av miniprot $PREFIX/bin
    cp -av miniprot.1 $PREFIX/share/man/man1

Test.

    $PREFIX/bin/miniprot test/DPP3-hs.gen.fa.gz test/DPP3-mm.pep.fa.gz

On snowy-lr1:

    cd /sw/bioinfo/miniprot
    source /sw/bioinfo/miniprot/SOURCEME_miniprot_0.13
    cd $SRCDIR
    ml gcc/12.3.0
    module load zlib/1.3
    cd miniprot-0.13
    make clean
    make 
    rm -f $PREFIX
    mkdir -p $PREFIX/bin
    mkdir -p $PREFIX/share/man/man1
    cp -av miniprot $PREFIX/bin/
    cp -av miniprot.1 $PREFIX/share/man/man1

Test.

    $PREFIX/bin/miniprot test/DPP3-hs.gen.fa.gz test/DPP3-mm.pep.fa.gz

man page can be found by adding $modroot/share/man to MANPATH.

cd $TOOLDIR/mf
vi 0.13

Wrap up.

    cd $TOOLDIR
    ./miniprot-0.13_post-install.sh 
