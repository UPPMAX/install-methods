sequenza-utils/3.0.0
========================

<https://bitbucket.org/sequenzatools/sequenza-utils/src/master/>

Used under license:



Structure creating script (makeroom_sequenza-utils_3.0.0.sh) moved to /sw/bioinfo/sequenza-utils/makeroom_3.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "sequenza-utils" "-v" "3.0.0" "-w" "https://bitbucket.org/sequenzatools/sequenza-utils/src/master/" "-d" "Analysis of cancer sequencing samples, utilities for the R package sequenza" "-s" "annotation"
    ./makeroom_sequenza-utils_3.0.0.sh
    source /sw/bioinfo/sequenza-utils/SOURCEME_sequenza-utils_3.0.0 && cd $TOOLDIR


    # Load modules
    module load bioinfo-tools
    module load samtools/1.5
    module load tabix/0.2.6
    module load bwa/0.7.17
    module load python/3.6.8


    # Pip install
    #PYTHONUSERBASE=$PREFIX pip install --user sequenza-utils==$VERSION

    # Git clone
    cd $SRCDIR
    git clone https://bitbucket.org/sequenzatools/sequenza-utils/src/master/ .
    git checkout tags/$VERSION

    # Install
    mkdir -p $PREFIX/lib/python3.6/site-packages/
    PYTHONUSERBASE=$PREFIX python setup.py install --user

    # Change shebang
    sed  -i '1 s/^.*$/\#\!\/usr\/bin\/env python/' $PREFIX/bin/sequenza-utils



    # Test. The test data is very specific about the bwa version. Please use 0.7.17.
    export PYTHONPATH=$PREFIX/lib/python3.6/site-packages/:$PYTHONPATH
    export PATH=$PREFIX/bin:$PATH
    python setup.py test

    


    
