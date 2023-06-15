pairtools/1.0.2
========================

<https://github.com/open2c/pairtools>

Used under license:
MIT


Structure creating script (makeroom_pairtools_1.0.2.sh) moved to /sw/bioinfo/pairtools/makeroom_1.0.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "pairtools" "-v" "1.0.2" "-s" "annotation" "-d" "pairtools is a simple and fast command-line framework to process sequencing data from a Hi-C experiment." "-l" "MIT" "-w" "https://github.com/open2c/pairtools"
    ./makeroom_pairtools_1.0.2.sh

    TOOL=pairtools
    VERSION=1.0.2

    #Load modules
    module load python/3.10.8


    # Download
    cd $SRCDIR
    wget https://github.com/open2c/pairtools/archive/refs/tags/v1.0.2.tar.gz
    tar xfvz v1.0.2.tar.gz  --strip-components=1


    # Pip install
    PYTHONUSERBASE=$PREFIX pip install pysam==0.21.0 numpy==1.21.6 click==8.1.3 cython pyyaml scipy pandas
    export PYTHONPATH=$PREFIX/lib/python3.10/site-packages/:$PYTHONPATH
    #export PYTHONPATH=$SRCDIR:$PYTHONPATH
    export PATH=$PREFIX/bin:$PATH
    PYTHONUSERBASE=$PREFIX pip install .

    # Change shebang to usr/bin/env python
    cd $PREFIX/bin
    sed -i '1c \#!\/usr\/bin\/env python' f2py  f2py3  f2py3.10  pairtools

    # Test
    mkdir $SRCDIR/test-pairtools 
    cd  $SRCDIR/test-pairtools
    wget https://github.com/open2c/distiller-test-data/raw/master/bam/MATalpha_R1.bam
    wget https://raw.githubusercontent.com/open2c/distiller-test-data/master/genome/sacCer3.reduced.chrom.sizes
    samtools sort MATalpha_R1.bam -o MATalpha_R1.sorted.bam
    samtools index MATalpha_R1.sorted.bam
    pairtools parse -c sacCer3.reduced.chrom.sizes -o MATalpha_R1.pairs.gz --drop-sam MATalpha_R1.sorted.bam



