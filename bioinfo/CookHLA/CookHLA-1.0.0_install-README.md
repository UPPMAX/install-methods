CookHLA/1.0.0
========================

<https://github.com/WansonChoi/CookHLA>

Used under license:



Structure creating script (makeroom_CookHLA_1.0.0.sh) moved to /sw/bioinfo/CookHLA/makeroom_1.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "CookHLA" "-v" "1.0.0" "-s" "annotation" "-d" "CookHLA is an accurate and efficient HLA imputation method." "-w" "https://github.com/WansonChoi/CookHLA"
    
    module load python/3.9.5
    module load perl/5.26.2
    module load R/3.6.1

    source /sw/bioinfo/CookHLA/SOURCEME_CookHLA_1.0.0 && cd $TOOLDIR

# Install pythonpackage
    PYTHONUSERBASE=$PREFIX pip install pyliftover==0.4
    export PYTHONPATH=/sw/bioinfo/CookHLA/1.0.0/rackham/lib/python3.9/site-packages

# Git clone
    cd $PREFIX
    git clone https://github.com/WansonChoi/CookHLA.git
    cd CookHLA
    PATH=$PATH:/sw/bioinfo/CookHLA/1.0.0/rackham/CookHLA/dependency
    CookHLA=$PREFIX/CookHLA/CookHLA.py

# Download liftover data
    mkdir $PREFIX/liftover_data
    wget -P $PREFIX/liftover_data http://hgdownload.cse.ucsc.edu/goldenPath/hg19/liftOver/hg19ToHg18.over.chain.gz
    wget -P $PREFIX/liftover_data http://hgdownload.cse.ucsc.edu/goldenPath/hg38/liftOver/hg38ToHg19.over.chain.gz
    
# Modify hardcoded relative paths to absolute  
    cd $PREFIX/CookHLA
    sed -s -i.bak 's/src\//\/sw\/bioinfo\/CookHLA\/1.0.0\/rackham\/CookHLA\/src\//' $(grep -r "src/" src/*{csh,py} -lI --exclude \*.bak)
    sed -s -i.bak 's/.\/src/\/sw\/bioinfo\/CookHLA\/1.0.0\/rackham\/CookHLA\/src\//' $(grep -r "\.\/src" * -lI --exclude \*.bak)
    sed -s -i.bak 's/.\/dependency/\/sw\/bioinfo\/CookHLA\/1.0.0\/rackham\/CookHLA\/dependency\//' $(grep -r "\.\/dependency" * -lI --exclude \*.bak)
    sed -s -i.bak 's/.\/MakeGeneticMap/\/sw\/bioinfo\/CookHLA\/1.0.0\/rackham\/CookHLA\/MakeGeneticMap\//' $(grep -r "\.\/MakeGeneticMap" * -lI --exclude \*.bak)
    sed -r -i.bak "s/(search_dir=')\.'/\1\/sw\/bioinfo\/CookHLA\/1\.0\.0\/rackham\/liftover_data\/'/" $PREFIX/lib/python3.9/site-packages/pyliftover/liftover.py


# Successfully tested with:
    cd $PREFIX/CookHLA
    mkdir MyAGM
    python -m MakeGeneticMap \
        -i example/1958BC.hg19 \
        -hg 19 \
        -ref 1000G_REF/1000G_REF.EUR.chr6.hg18.29mb-34mb.inT1DGC \
        -o MyAGM/1958BC+1000G_REF.EUR


    mkdir MyHLAImputation
    python $CookHLA \
               -i example/1958BC.hg19 \
               -hg 19 \
               -o MyHLAImputation/1958BC+HM_CEU_REF \
               -ref example/HM_CEU_REF \
               -gm example/AGM.1958BC+HM_CEU_REF.mach_step.avg.clpsB \
               -ae example/AGM.1958BC+HM_CEU_REF.aver.erate \
               -mem 2g

