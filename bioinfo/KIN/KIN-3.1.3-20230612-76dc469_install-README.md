KIN/3.1.3-20230612-76dc469
==========================

<https://github.com/DivyaratanPopli/Kinship_Inference>

Used under license:
GPL v3


Structure creating script (makeroom_KIN_3.1.3-20230612-76dc469.sh) moved to /sw/bioinfo/KIN/makeroom_3.1.3-20230612-76dc469.sh

LOG
---

    makeroom.sh "-f" "-t" "KIN" "-v" "3.1.3-20230612-76dc469" "-c" "bioinfo" "-s" "phylogeny" "-w" "https://github.com/DivyaratanPopli/Kinship_Inference" "-l" "GPL v3" "-d" "a tool to estimate pairwise relatedness from ancient DNA, taking in account contamination, ROH, ascertainment bias"
    ./makeroom_KIN_3.1.3-20230612-76dc469.sh 
    source /sw/bioinfo/KIN/SOURCEME_KIN_3.1.3-20230612-76dc469 && cd $SRCDIR

    ml python/3.8.7
    ml git/2.34.1
    ml bioinfo-tools
    ml samtools/1.17
    ml bcftools/1.17

    git clone https://github.com/DivyaratanPopli/Kinship_Inference.git
    cd Kinship_Inference/
    git reset --hard 76dc469

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    cd $SRCDIR/
    cd Kinship_Inference/
    pip --version
    pip install scipy==1.8.0 numpy==1.21.1 pandas==1.3.1 numba==0.55.1 pysam==0.19.0 pybedtools==0.9.0
    cd pypackage/
    pip install ./kin
    pip install ./kingaroo/ 
    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/{KIN,KINgaroo,numba} .

We cannot run the toy example with this version.

    cd $TOOLDIR

    ./KIN-3.1.3-20230612-76dc469_post-install.sh 

Set version 3.1.3 as the default version.
