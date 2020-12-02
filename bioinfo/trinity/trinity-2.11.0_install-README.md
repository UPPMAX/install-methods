trinity/2.11.0
========================

<https://github.com/trinityrnaseq/trinityrnaseq/wiki>

Used under license:
Custom 'AS IS'
<https://github.com/trinityrnaseq/trinityrnaseq/blob/master/LICENSE>

Structure creating script (makeroom_trinity_2.11.0.sh) moved to /sw/bioinfo/trinity/makeroom_2.11.0.sh

LOG
---

    TOOL=trinity
    VERSION=2.11.0
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w "https://github.com/trinityrnaseq/trinityrnaseq/wiki" -s "assembly" -d "assembles transcript sequences from Illumina RNA-Seq data" -l "Custom \'AS IS\'" -L "https://github.com/trinityrnaseq/trinityrnaseq/blob/master/LICENSE"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    rmdir $PREFIX
    cd src
    wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/v${VERSION}/trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz
    tar xzf trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz 
    mv trinityrnaseq-v${VERSION} $PREFIX
    cd $PREFIX
    module load cmake/3.17.3
    module load gcc/9.3.0
    module load java/sun_jdk1.8.0_151
    module load bioinfo-tools bowtie2/2.3.5.1
    make
    make plugins

Now test... these are required for testing, all but blast might be required for normal operations.

    module load samtools/1.10
    module load Salmon/1.1.0
    module load jellyfish/2.3.0
    module load blast/2.10.1+

    cd sample_data
    export TRINITY_HOME=$PREFIX
    make

