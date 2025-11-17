refgenie/0.12.1
===============

<https://refgenie.databio.org/en/latest/>

Used under license:
BSD 2-clause


Structure creating script (makeroom_refgenie_0.12.1.sh) moved to /sw/bioinfo/refgenie/makeroom_0.12.1.sh

LOG
---

    makeroom.sh -t refgenie -v 0.12.1 -c bioinfo -s misc -w https://refgenie.databio.org/en/latest/ -d "Refgenie manages storage, access, and transfer of reference genome resources." -l "BSD 2-clause"
    ./makeroom_refgenie_0.12.1.sh 
    source /sw/bioinfo/refgenie/SOURCEME_refgenie_0.12.1 && cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    pip install refgenie==0.12.1
    ll venv/bin/
    mkdir bin
    cd bin
    ln -s ../venv/bin/refgenie .
    deactivate
    ./refgenie 

The mf contains a lot.

    cd ../../../mf
    vi 0.12.1 

Tested by installing several reference pieces.

    ml refgenie/0.12.1
    module help refgenie/0.12.1
    refgenie init -c genome_config.yaml
    chmod u+w,g+w genome_config.yaml
    export REFGENIE=$PWD/genome_config.yaml

    refgenie listr

    refgenie pull hg38/fasta hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb
    refgenie pull hg38/bwa_index hg38/hisat2_index hg38/salmon_index hg38/bowtie2_index
    refgenie build hg38/feat_annotation
