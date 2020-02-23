bam2fastx/1.3.0-80dbf79
========================

<https://github.com/PacificBiosciences/bam2fastx>

Used under license:
BSD 3-clause

Structure creating script (makeroom_bam2fastx_1.3.0-80dbf79.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bam2fastx/makeroom_1.3.0-80dbf79.sh

Install using conda.

LOG
---

    TOOL=bam2fastx
    VERSION=1.3.0-80dbf79
    CLUSTER=rackham
    ./makeroom_bam2fastx_1.3.0-80dbf79.sh

Built on snowy-lr1 to get around the bioconda blocking issue.

    cd /sw/bioinfo
    makeroom.sh -t bam2fastx -v 1.3.0-80dbf79 -w https://github.com/PacificBiosciences/bam2fastx -s misc -l "BSD 3-clause" -d "Converting and demultiplexing of PacBio BAM files into gzipped fasta and fastq files" 
    ./makeroom_bam2fastx_1.3.0-80dbf79.sh 
    cd bam2fastx
    source SOURCEME_bam2fastx_1.3.0-80dbf79
    module load conda/latest
    export CONDA_ENVS_PATH=$PREFIX
    conda install -p $PREFIX -c bioconda bam2fastx

Use mf from blasr.  Needs to set `PATH` and `LD_LIBRARY_PATH`.
