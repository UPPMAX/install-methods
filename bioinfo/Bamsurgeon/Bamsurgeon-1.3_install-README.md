Bamsurgeon/1.3
========================

<https://github.com/adamewing/bamsurgeon>

Used under license:
MIT License


Structure creating script (makeroom_Bamsurgeon_1.3.sh) moved to /sw/bioinfo/Bamsurgeon/makeroom_1.3.sh

LOG
---


    TOOL=Bamsurgeon
    VERSION=1.3

    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/adamewing/bamsurgeon -l 'MIT License' -d 'tools for adding mutations to .bam files, used for testing mutation callers'

    ./makeroom_Bamsurgeon_1.3.sh
    source SOURCEME_Bamsurgeon_1.3

    module load python/3.8.7
    module load gcc/9.3.0

    cd $SRCDIR

    wget https://github.com/adamewing/bamsurgeon/archive/refs/tags/1.3.tar.gz
    tar xvf 1.3.tar.gz
    cd bamsurgeon-1.3/

    module load bioinfo-tools
    module load bwa/0.7.17
    module load samtools/1.12
    module load bcftools/1.12
    module load htslib/1.12
    module load velvet/1.2.10
    module load exonerate/2.4.0

    python setup.py build --build-lib=$PREFIX
    python setup.py install  --prefix=$PREFIX
