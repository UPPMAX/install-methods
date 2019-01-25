MaSuRCA/3.2.3
=============

WGS assembler for varied DNA sequence data

Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013).  doi:10.1093/bioinformatics/btt476

<http://www.genome.umd.edu/masurca.html>

For the module, load `perl/5.24.1` and `perl_modules/5.24.1` and add </sw/apps/bioinfo/MaSuRCA/2.3.2/$Cluster/bin> to `PATH`.


LOG
===

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=3.2.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL/$VERSION/$CLUSTER
    TOOLDIR=$TOOL/$VERSION
    PFX=$TOOL/$VERSION/$CLUSTER
    cd $TOOLDIR
    mkdir -p src
    cd src
    [[ -f MaSuRCA-${VERSION}.tar.gz ]] || wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/latest/MaSuRCA-${VERSION}.tar.gz
    tar xzf MaSuRCA-${VERSION}.tar.gz
    mv MaSuRCA-${VERSION} MaSuRCA-${VERSION}-${CLUSTER}
    cd MaSuRCA-${VERSION}-${CLUSTER}

    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0

    DEST=$PFX ./install.sh

    cd ..
    rm -rf MaSuRCA-${VERSION}-${CLUSTER}

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
    $PFX/bin/masurca sr_config_Illumina_Sanger_1x.txt

    ./assemble.sh

The stats of this test, calculated by a script derived from ABySS's stats script, are:

    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.3/test_milou $ module load bioinfo-tools biopython
    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.3/test_milou $ ~/bin/assembly_stats.py CA/dedup.genome.scf.fasta
    ['/home/douglas/bin/assembly_stats.py', 'CA/dedup.genome.scf.fasta']
    n      |n:500  |n:N50  |min  |N80    |N50    |N20    |E-size  |max     |sum(n:500)|sum
    ---    |---    |---    |---  |---    |---    |---    |---     |---     |---       |---
    20  |19   |1    |522  |674653  |3190531  |235774  |        |3190531  |4474839  |4475633
    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.3/test_milou $ ~/bin/assembly_stats.py CA/10-gapclose/genome.ctg.fasta
    ['/home/douglas/bin/assembly_stats.py', 'CA/10-gapclose/genome.ctg.fasta']
    n      |n:500  |n:N50  |min  |N80    |N50    |N20    |E-size  |max     |sum(n:500)|sum
    ---    |---    |---    |---  |---    |---    |---    |---     |---     |---       |---
    147  |141   |23    |522  |27330  |54966  |117313  |        |324256  |4486424  |4488944
    milou-b: /sw/apps/bioinfo/MaSuRCA/3.2.3/test_milou $ ~/bin/assembly_stats.py CA/10-gapclose/genome.scf.fasta
    ['/home/douglas/bin/assembly_stats.py', 'CA/10-gapclose/genome.scf.fasta']
    n      |n:500  |n:N50  |min  |N80    |N50    |N20    |E-size  |max     |sum(n:500)|sum
    ---    |---    |---    |---  |---    |---    |---    |---     |---     |---       |---
    32  |26   |1    |522  |674653  |3190531  |235774  |        |3190531  |4498545  |4501065

MaSuRCA/3.2.3 produces a new final output file, `CA/dedup.genome.scf.fasta`.

If numbers are similar, all good, so remove the `test_$CLUSTER` directory.  The
numbers between milou and rackham are not the same, rackham a little worse, but
probably stochastic issues.  The numbers are clearly worse if built with the 4x
Sanger reads.

    cd ..
    rm -rf test_$CLUSTER

The mf file
-----------

The mf file needs to load perl stuff, but other than that the rest is gathered from context.

    module load perl/5.24.1
    module load perl_modules/5.24.1

and update `PATH` to include the `bin` directory.

    prepend-path    PATH               $modroot/bin


