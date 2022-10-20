platypus/3e72641
========================

<https://github.com/andyrimmer/Platypus>

Used under license:
GNU3


Structure creating script (makeroom_platypus_3e72641.sh) moved to /sw/bioinfo/platypus/makeroom_3e72641.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "platypus" "-v" "3e72641" "-w" "https://github.com/andyrimmer/Platypus" "-l" "GNU3" "-s" "annotation"
    ./makeroom_platypus_3e72641.sh
    cd $PREFIX
   
# Git clone 
    git clone https://github.com/andyrimmer/Platypus.git .

# Load modules
    module load bioinfo-tools
    module load python/2.7.15
    module load gcc/4.9.4
    module load htslib/1.3

# Make
    make

# Change permissions to Platypus.py
    chmod 775 $PREFIX/bin/Platypus.py 

# ------TEST------
# Copy test data from ngs-course 
# After module load Platypus/20180620-3e72641: 
    mkdir ${VERSIONDIR}/test_data
    cd ${VERSIONDIR}/test_data

    ln -s /sw/courses/ngsintro/reseq/data/bam/HG00097.bam* .
    ln -s /sw/courses/ngsintro/reseq/data/ref/human_g1k_v37_chr2.fasta .
    rename "HG00097" human_g1k_v37_chr2 HG00097.bam*

    module load samtools
    samtools faidx human_g1k_v37_chr2.fasta

    Platypus.py callVariants --bamFiles human_g1k_v37_chr2.bam --refFile human_g1k_v37_chr2.fasta --output human_g1k_v37.vcf




    



