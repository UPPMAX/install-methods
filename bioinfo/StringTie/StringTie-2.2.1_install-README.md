StringTie/2.2.1
===============

<https://ccb.jhu.edu/software/stringtie/>

Used under license:
MIT

Structure creating script (makeroom_StringTie_2.2.1.sh) moved to /sw/bioinfo/StringTie/makeroom_2.2.1.sh

LOG
---

    TOOL=StringTie
    VERSION=2.2.1
    makeroom.sh -f -s "assembly" -t "$TOOL" -v "${VERSION}" -w "https://ccb.jhu.edu/software/stringtie/" -l "MIT" -d "fast and highly efficient assembler of RNA-Seq alignments into potential transcripts"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source /sw/bioinfo/$TOOL/SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR

    wget https://github.com/gpertea/stringtie/releases/download/v2.2.1/stringtie-${VERSION}.tar.gz
    tar xf stringtie-${VERSION}.tar.gz 
    cd stringtie-${VERSION}/
    module load gcc/12.3.0
    make release
    ./run_tests.sh 
    cp -av prepDE.py3 stringtie $PREFIX/
    cd $PREFIX
    ln -s prepDE.py3 prepDE.py

Update the mf (used by all currently installed versions) and wrap up.

    cd $TOOLDIR/mf
    vi 1.2.0
    ln -sf 1.2.0 2.1.4
    ln -sf 1.2.0 2.2.1

    cd $TOOLDIR
    ./StringTie-2.2.1_post-install.sh

    cd $TOOLDIR/mf
    rsync -Pa * /sw/mf/common/bioinfo-tools/assembly/StringTie/
