SweepFinder2/1.0
================

<http://degiorgiogroup.fau.edu/sf2.html>

Used under license:
Open-source


Structure creating script (makeroom_SweepFinder2_1.0.sh) moved to /sw/bioinfo/SweepFinder2/makeroom_1.0.sh

LOG
---

Code includes some multiple definition errors that older gcc versions don't complain about, but newer versions (e.g., gcc/10.3.0) treat as errors. So, I compile with gcc/6.3.0 to maintain whatever the current semantics are.


    makeroom.sh -t "SweepFinder2" -v "1.0" -w "http://degiorgiogroup.fau.edu/sf2.html" -c "bioinfo" -s misc -l "Open-source" -d "A program written in C that can perform genomic scans for recent selective sweeps selection while controlling for background selection and mutation rate variation" -f
    ./makeroom_SweepFinder2_1.0.sh 
    source /sw/bioinfo/SweepFinder2/SOURCEME_SweepFinder2_1.0
    cd $SRCDIR
    wget http://degiorgiogroup.fau.edu/SF2.tar.gz
    tar xf SF2.tar.gz 
    cd SF2
    ml gcc/6.3.0
    make

Test.

    cd example_input/
    ../SweepFinder2 -lr 100 BGS_noSweep.SF.65.invar1 Neutral_Background.sfs.invar1  BGS_noSweep.Rec_map.65.invar1 Out.txt
    cat Out.txt 

Install.

    cd ..
    cp -av SweepFinder2 Manual_SweepFinder2_v1.0.pdf $PREFIX/

