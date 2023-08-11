CAT-BAT/5.2.3
=============

<https://github.com/dutilh/CAT>

Used under license:
MIT


Structure creating script (makeroom_CAT-BAT_5.2.3.sh) moved to /sw/bioinfo/CAT-BAT/makeroom_5.2.3.sh

LOG
---

    makeroom.sh -c bioinfo -s annotation -t CAT-BAT -v 5.2.3  -w https://github.com/dutilh/CAT -l "MIT" -d "CAT/BAT: tool for taxonomic classification of contigs and metagenome-assembled genomes (MAGs)"
    ./makeroom_CAT-BAT_5.2.3.sh 
    source /sw/bioinfo/CAT-BAT/SOURCEME_CAT-BAT_5.2.3 && cd $SRCDIR
    ml git/2.34.1
    ml python/3.9.5
    ml bioinfo-tools
    ml diamond/2.0.6  ## this one I installed to match the downloaded database
    ml prodigal/2.6.3
    git clone https://github.com/dutilh/CAT
    cd CAT/
    rmdir $PREFIX && cp -av CAT_pack $PREFIX     ## the tool
    cp -av CAT/tests $PREFIX/                    ## test data

Download database and place it within PREFIX. Very large, 180GB. The download, MD5 check and unpacking takes a long time.

    wget https://tbb.bio.uu.nl/bastiaan/CAT_prepare/CAT_prepare_20210107.tar.gz
    wget https://tbb.bio.uu.nl/bastiaan/CAT_prepare/CAT_prepare_20210107.tar.gz.md5
    md5sum -c CAT_prepare_20210107.tar.gz.md5 
    tar xvf CAT_prepare_20210107.tar.gz 

    mv CAT_prepare_20210107 $PREFIX

Now to run the tests. Prepare the test database, then annotate with it.

    export PATH=$PREFIX:$PATH
    export TESTDATA=$PREFIX/tests

    cd $TESTDATA
    cd data/prepare
    CAT prepare --db_fasta small.fa --names names.dmp --nodes nodes.dmp --acc2tax prot2acc.txt --db_dir test_dir

    cd ../contigs
    CAT contigs -c small_contigs.fa  --database_folder $TESTDATA/data/prepare/test_dir/db  --taxonomy_folder $TESTDATA/data/prepare/test_dir/tax

To make getting the data and test data easier, add these to the mf.

    setenv CAT_BAT_DATA          $modroot/CAT_prepare_20210107
    setenv CAT_BAT_TESTDATA      $modroot/tests/data

Describe to the user how to set up the test data.

    CAT prepare --db_fasta $CAT_BAT_TESTDATA/prepare/small.fa --names $CAT_BAT_TESTDATA/prepare/names.dmp --nodes $CAT_BAT_TESTDATA/prepare/nodes.dmp --acc2tax $CAT_BAT_TESTDATA/prepare/prot2acc.txt --db_dir test_dir

    CAT contigs -c $CAT_BAT_ESTDATA/contigs/small_contigs.fa  --database_folder test_dir/db  --taxonomy_folder test_dir/tax

Describe to the user how to use the provided database, and the diamond version match issue.
