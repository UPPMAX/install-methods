MTD/20240507-d488faf
========================

<https://github.com/FEI38750/MTD>

Used under license:



Structure creating script (makeroom_MTD_20240507-d488faf.sh) moved to /sw/bioinfo/MTD/makeroom_20240507-d488faf.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "MTD" "-v" "20240507-d488faf" "-d" "MTD: a unique pipeline for host and meta-transcriptome joint and integrative analyses of RNA-seq data" "-s" "annotation" "-w" "https://github.com/FEI38750/MTD"
    ./makeroom_MTD_20240507-d488faf.sh

# This is a custom install of the MTD software. The conda and git src files will be in the prefix directory and will point to the databases located in /sw/data/

    module load conda/latest
    module load R_packages/4.2.1

# Get the git repo and install the 3 conda environments, except the R412. R_packages 4.2.1 can be used instead.
    cd $PREFIX
    git clone https://github.com/FEI38750/MTD.git
    cd MTD
    git checkout d488faf
    git reset --hard

# Create conda
    export dir=$PREFIX
    export gitdir=$PREFIX/MTD
    # get conda path
    
    source /sw/apps/conda/latest/rackham_stage/etc/profile.d/conda.sh

    echo 'installing conda environments...'
    conda env create -p ${dir}/conda/MTD -f         ${gitdir}/Installation/MTD.yml
    conda env create -p ${dir}/conda/py2 -f         ${gitdir}/Installation/py2.yml
    conda env create -p ${dir}/conda/halla0820 -f   ${gitdir}/Installation/halla0820.yml
    conda env create -p ${dir}/conda/R412 -f        ${gitdir}/Installation/R412.yml
