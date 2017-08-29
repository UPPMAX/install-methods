MaSuRCA/3.2.2
=============

WGS assembler for varied DNA sequence data

Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013).  doi:10.1093/bioinformatics/btt476

<http://www.genome.umd.edu/masurca.html>

For the module, load `perl/5.24.1` and `perl_modules/5.24.1` and add </sw/apps/bioinfo/MaSuRCA/2.3.2/$Cluster/bin> to `PATH`.


LOG
===

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=3.2.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION/$CLUSTER
    TOOLDIR=$TOOL/$VERSION
    PREFIX=$TOOL/$VERSION/$CLUSTER
    cd $TOOLDIR
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    [[ -f MaSuRCA-${VERSION}.tar.gz ]] || wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/latest/MaSuRCA-${VERSION}.tar.gz
    tar xzf MaSuRCA-${VERSION}.tar.gz
    cd MaSuRCA-${VERSION}

    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0

    DEST=$PREFIX ./install.sh

Lots of building, and RPATH is set properly for the executables so we do not
need to set `LD_LIBRARY_PATH`.  The load of `perl_modules` is to get
`Statistics::Descriptive`.

Test
----

Get *Rhodobacter* test data into a tool directory.  Do this part just once, and
these data will be available for all future builds.

    cd $TOOL
    mkdir test_data
    cd test_data
    lftp ftp://ftp.genome.umd.edu/pub/MaSuRCA/test_data/

Within lftp:

    mirror rhodobacter

It took a while to complete.  When done, exit lftp and compress the fastq files.

    cd rhodobacter/PE
    for F in *.fastq; do pbzip2 -p8 $F; done
    cd ../SJ
    for F in *.fastq; do pbzip2 -p8 $F; done
    cd ..

Set up an assembly config file using 1x Sanger data.  Here's the new config
file to use for assemblies:

    milou-b: /sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter $ cat sr_config_Illumina_Sanger_1x.txt
    PARAMETERS
    CA_PARAMETERS= ovlMerSize=30 cgwErrorRate=0.25 merylMemory=8192 ovlMemory=4GB
    LIMIT_JUMP_COVERAGE = 60
    KMER_COUNT_THRESHOLD = 1
    EXTEND_JUMP_READS=0
    NUM_THREADS= 8
    JF_SIZE=50000000
    END

    DATA
    PE=  pe 180 20 /sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter/PE/frag_1.fastq.bz2 /sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter/PE/frag_2.fastq.bz2
    JUMP= sj 3600 200  /sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter/SJ/short_1.fastq.bz2  /sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter/SJ/short_2.fastq.bz2
    OTHER=/sw/apps/bioinfo/MaSuRCA/test_data/rhodobacter/Sanger/rhodobacter_sphaeroides_2_4_1.1x.frg
    END

Now run a test assembly for this version.

    cd $TOOLDIR
    rm -rf test_$CLUSTER
    mkdir test_$CLUSTER
    cd test_$CLUSTER
    cp -av $TOOL/test_data/rhodobacter/sr_config_Illumina_Sanger_1x.txt .
    $PREFIX/bin/masurca sr_config_Illumina_Sanger_1x.txt

    ./assemble.sh

The stats of this test, calculated by a script derived from ABySS's stats script, are:

    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.2/test $ module load bioinfo-tools biopython
    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.2/test $ ~/bin/assembly_stats.py CA/10-gapclose/genome.ctg.fasta
    ['/home/douglas/bin/assembly_stats.py', 'CA/10-gapclose/genome.ctg.fasta']
    n      |n:500  |n:N50  |min  |N80    |N50    |N20    |E-size  |max     |sum(n:500)|sum
    ---    |---    |---    |---  |---    |---    |---    |---     |---     |---       |---
    153  |143   |25    |515  |27186  |53467  |117313  |        |257997  |4515760  |4520070

    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.2/test $ ~/bin/assembly_stats.py CA/10-gapclose/genome.scf.fasta
    ['/home/douglas/bin/assembly_stats.py', 'CA/10-gapclose/genome.scf.fasta']
    n      |n:500  |n:N50  |min  |N80    |N50    |N20    |E-size  |max     |sum(n:500)|sum
    ---    |---    |---    |---  |---    |---    |---    |---     |---     |---       |---
    39  |29   |1    |515  |904006  |2807880  |387929  |        |2807880  |4529255  |4533565

If numbers are similar, all good, so remove the `test_$CLUSTER` directory.  The numbers are clearly worse if built with
the 4x Sanger reads.

    cd ..
    rm -rf test_$CLUSTER

The mf file
-----------

The mf file needs to load perl stuff, but other than that the rest is gathered from context.

    module load perl/5.24.1
    module load perl_modules/5.24.1

and update `PATH` to include the `bin` directory.

    prepend-path    PATH               $modroot/bin


