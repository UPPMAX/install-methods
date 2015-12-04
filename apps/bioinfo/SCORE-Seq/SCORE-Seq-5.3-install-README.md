SCORE-Seq 5.3
=============

SCORE-Seq Score Tests for Detecting Disease Associations With Rare Variants in Sequencing Studies


    cd /sw/apps/bioinfo/
    mkdir SCORE-Seq
    cd SCORE-Seq/
    mkdir mf 5.3
    cd 5.3
    mkdir milou
    cd milou src
    cd src
    wget http://dlin.web.unc.edu/files/2013/01/SCORE-Seq_V5.31.zip
    wget http://dlin.web.unc.edu/files/2013/01/example_SCORE-Seq_V5.3.zip

    unzip SCORE-Seq_V5.31.zip 
    chmod +x SCORE-Seq
    ./SCORE-Seq 

    unzip example_SCORE-Seq_V5.3.zip 
    cp -av example SCORE-Seq ../milou/
    cd ..
    ln -s ./milou halvan
    ln -s ./milou nestor
    ln -s ./milou tintin


    cd ../mf
    vi 5.3 

Simply add the milou/ directory to the PATH.  Both milou and tintin can use
the same executable.

    cd /sw/mf/common/bioinfo-tools/misc/
    mkdir SCORE-Seq
    cp /sw/apps/bioinfo/SCORE-Seq/mf/5.3 SCORE-Seq/
    chgrp -Rh sw SCORE-Seq/
    cd /sw/mf/milou/bioinfo-tools/misc/
    mkdir SCORE-Seq
    cd SCORE-Seq/
    ln -s ../../../../common/bioinfo-tools/misc/SCORE-Seq/5.3 .
    cd ..
    chgrp -Rh sw SCORE-Seq/

    cd ../../../tintin/bioinfo-tools/misc/
    mkdir SCORE-Seq
    cd SCORE-Seq/
    ln -s ../../../../common/bioinfo-tools/misc/SCORE-Seq/5.3 .
    cd ..
    chgrp -Rh sw SCORE-Seq/

