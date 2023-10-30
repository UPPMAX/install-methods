KIN/3.1.3
=========

<https://github.com/DivyaratanPopli/Kinship_Inference>

Used under license:
GPL v3


Structure creating script (makeroom_KIN_3.1.3.sh) moved to /sw/bioinfo/KIN/makeroom_3.1.3.sh

LOG
---

    makeroom.sh "-f" "-t" "KIN" "-v" "3.1.3" "-c" "bioinfo" "-s" "phylogeny" "-w" "https://github.com/DivyaratanPopli/Kinship_Inference" "-l" "GPL v3" "-d" "a tool to estimate pairwise relatedness from ancient DNA, taking in account contamination, ROH, ascertainment bias"
    ./makeroom_KIN_3.1.3.sh 
    source /sw/bioinfo/KIN/SOURCEME_KIN_3.1.3 && cd $SRCDIR

    ml python/3.8.7
    ml git/2.34.1
    ml bioinfo-tools
    ml samtools/1.17
    ml bcftools/1.17

    git clone https://github.com/DivyaratanPopli/Kinship_Inference.git
    cd Kinship_Inference/
    git reset --hard v3.1.3

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

Run the toy example, which only works with 3.1.3 because the -T option and
targets.txt file only exist there.

    cd $SRCDIR/Kinship_Inference
    cd KIN_toy_example/
    KIN -I ./ -O ./ -T targets.txt 

Wrap up.

    cd $TOOLDIR
    ./KIN-3.1.3_post-install.sh 

Set this version as the default version.
