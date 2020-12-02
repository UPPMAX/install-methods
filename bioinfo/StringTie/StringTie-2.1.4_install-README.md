StringTie/2.1.4
===============

<https://ccb.jhu.edu/software/stringtie/>

Used under license:
MIT

Structure creating script (makeroom_StringTie_2.1.4.sh) moved to /sw/bioinfo/StringTie/makeroom_2.1.4.sh

LOG
---

    TOOL=StringTie
    VERSION=2.1.4
    cd /sw/bioinfo/${TOOL}/
    makeroom.sh -f -s "assembly" -t "$TOOL" -v "${VERSION}" -w "https://ccb.jhu.edu/software/stringtie/" -l "MIT" -d "fast and highly efficient assembler of RNA-Seq alignments into potential transcripts"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR
    wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-${VERSION}.tar.gz
    tar xzf stringtie-${VERSION}.tar.gz 
    cd stringtie-${VERSION}/
    module load gcc/9.3.0
    make release
    ./run_tests.sh 
    cp -av prepDE.py stringtie $PREFIX/
