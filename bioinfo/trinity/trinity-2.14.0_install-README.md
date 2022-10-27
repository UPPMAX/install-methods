trinity/2.14.0
========================

<http://>

Used under license:



Structure creating script (makeroom_trinity_2.14.0.sh) moved to /sw/bioinfo/trinity/makeroom_2.14.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "trinity" "-v" "2.14.0" "-f"
    ./makeroom_trinity_2.14.0.sh

    TOOL=trinity
    VERSION=2.14.0

# Download and extract
    cd $SRCDIR
    wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/Trinity-v${VERSION}/trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz
    tar xvzf trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz --strip-components=1 -C $PREFIX

# Make
    cd $PREFIX
    module load cmake/3.22.2
    module load gcc/9.3.0
    module load java/sun_jdk1.8.0_151
    module load bioinfo-tools bowtie2/2.4.5
    make -j 20
    make plugins

Now test... these are required for testing, all but blast might be required for normal operations.

    module load samtools/1.14
    module load Salmon/1.9.0
    module load jellyfish/2.3.0
    module load blast/2.12.0+
    module load python/3.9.5

    cd sample_data
    export TRINITY_HOME=$PREFIX
    make




trinity/2.13.2
========================

<https://github.com/trinityrnaseq/trinityrnaseq/wiki>

Used under license:
Custom \'AS IS\'
<https://github.com/trinityrnaseq/trinityrnaseq/blob/master/LICENSE>

Structure creating script (makeroom_trinity_2.13.2.sh) moved to /sw/bioinfo/trinity/makeroom_2.13.2.sh

LOG
---
    TOOL=trinity
    VERSION=2.13.2

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -f -t "trinity" -v "2.13.2" -w "https://github.com/trinityrnaseq/trinityrnaseq/wiki" -s "assembly" -d "assembles transcript sequences from Illumina RNA-Seq data" -l "Custom \\'AS IS\\'" -L "https://github.com/trinityrnaseq/trinityrnaseq/blob/master/LICENSE"
    ./makeroom_trinity_2.13.2.sh

    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    rmdir $PREFIX
    cd src
    wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/Trinity-v${VERSION}/trinityrnaseq-v${VERSION}.FULL_with_extendedTestData.tar.gz
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

    module load samtools/1.12
    module load Salmon/1.4.0
    module load jellyfish/2.3.0
    module load blast/2.11.0+
    module load python/3.9.5

    cd sample_data
    export TRINITY_HOME=$PREFIX
    make

