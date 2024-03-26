miniprot/0.12
========================

<https://github.com/lh3/miniprot>

Used under license:
MIT


Structure creating script (makeroom_miniprot_0.12.sh) moved to /sw/bioinfo/miniprot/makeroom_0.12.sh

Edits and rebuild later by Douglas. Need separate snowy build.

LOG
---

    makeroom.sh "-t" "miniprot" "-v" "0.12" -w "https://github.com/lh3/miniprot" "-d" "Align proteins to genomes with splicing and frameshift" "-l" "MIT" "-s" "alignment"
    ./makeroom_miniprot_0.12.sh
    source /sw/bioinfo/miniprot/SOURCEME_miniprot_0.12
    cd $SRCDIR

    # Load modules
    module load git/2.34.1
    module load gcc/12.3.0
    module load zlib/1.3

    # Download
    git clone https://github.com/lh3/miniprot.git
    cd miniprot
    git reset --hard 3ef6d3d

This includes a fix for non-SSE4.2 machines. SO we compile separately on snowy.

On rackham5:

    make clean
    make 
    mkdir $PREFIX/bin
    cp -av miniprot $PREFIX/bin

Test.

    $PREFIX/bin/miniprot test/DPP3-hs.gen.fa.gz test/DPP3-mm.pep.fa.gz

On snowy-lr1:

    cd /sw/bioinfo/miniprot
    source /sw/bioinfo/miniprot/SOURCEME_miniprot_0.12
    cd $SRCDIR
    ml gcc/12.3.0
    module load zlib/1.3
    cd miniprot
    make clean
    make 
    rm -f $PREFIX
    mkdir -p $PREFIX/bin
    cp -av miniprot $PREFIX/bin/

Test.

    $PREFIX/bin/miniprot test/DPP3-hs.gen.fa.gz test/DPP3-mm.pep.fa.gz





