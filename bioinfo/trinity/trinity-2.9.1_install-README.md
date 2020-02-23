trinity/2.9.1
========================

<https://github.com/trinityrnaseq/trinityrnaseq>

Used under license:
Custom open-source 'as is'

Structure creating script (makeroom_trinity_2.9.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/trinity/makeroom_2.9.1.sh


LOG
---

    VERSION=2.9.1
    cd /sw/bioinfo/trinity/
    makeroom.sh -f -t trinity -s assembly -v ${VERSION} -w https://github.com/trinityrnaseq/trinityrnaseq -d "novel method for the efficient and robust de novo reconstruction of transcriptomes from RNA-seq data" -l "Custom open-source 'as is'"
    ./makeroom_trinity_${VERSION}.sh 
    source SOURCEME_trinity_${VERSION} 

    cd ${VERSION}/
    rmdir $PREFIX
    cd src
    wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/v${VERSION}/trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz
    tar xzf trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz 
    mv trinityrnaseq-v${VERSION} $PREFIX
    cd $PREFIX
    module load cmake/3.7.2
    module load gcc/8.3.0
    module load java/sun_jdk1.8.0_151
    module load bioinfo-tools bowtie2/2.3.5.1
    make
    make plugins

Now test... these are required for testing, all but blast might be required for normal operations.

    module load samtools/1.10
    module load Salmon/1.1.0
    module load jellyfish/2.2.6
    module load blast/2.9.0+

    cd sample_data
    export TRINITY_HOME=$PREFIX
    make

