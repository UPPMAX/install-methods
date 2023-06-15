Juicer/2.0
========================

<https://github.com/aidenlab/juicer>

Used under license:
MIT License


Structure creating script (makeroom_Juicer_2.0.sh) moved to /sw/bioinfo/Juicer/makeroom_2.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "Juicer" "-v" "2.0" "-w" "https://github.com/aidenlab/juicer" "-c" "bioinfo" "-l" "MIT License" "-d" "Juicer is a platform for analyzing kilobase resolution Hi-C data." "-s" "pipelines" "-f"
    
    ./makeroom_Juicer_2.0.sh

    source /sw/bioinfo/Juicer/SOURCEME_Juicer_2 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/aidenlab/juicer/
    ln -s SLURM/scripts/ scripts
    cd scripts
    wget https://hicfiles.tc4ga.com/public/juicer/juicer_tools.1.9.9_jcuda.0.8.jar
    ln -sf juicer_tools.1.9.9_jcuda.0.8.jar juicer_tools.jar
    cd ..
# some files that may already be present in exisiting database
    mkdir references; cd references
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta.amb
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta.ann
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta.bwt
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta.pac
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/references/Homo_sapiens_assembly19.fasta.sa
    mkdir ../restriction_sites; cd ../restriction_sites
    wget https://s3.amazonaws.com/juicerawsmirror/opt/juicer/restriction_sites/hg19_MboI.txt
    cd ..
    mkdir HIC003; cd HIC003
    mkdir fastq; cd fastq
    wget http://juicerawsmirror.s3.amazonaws.com/opt/juicer/work/HIC003/fastq/HIC003_S2_L001_R1_001.fastq.gz
    wget http://juicerawsmirror.s3.amazonaws.com/opt/juicer/work/HIC003/fastq/HIC003_S2_L001_R2_001.fastq.gz
    cd ../..

# One has to modify the scripts/juicer.sh file.
# make a copy of the original file
    cp juicer.sh juicer-orig.sh

# edit juicer.sh by looking at the previous modified versions
# perhaps spot differences with `diff` in the previous versions?
# Mainly regarding UPPMAX cluster configs and change to <spaces> instead of <tabs> in "in-doc code"

