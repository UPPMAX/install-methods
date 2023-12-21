Mothur/1.48.0
========================

<http://>

Used under license:



Structure creating script (makeroom_Mothur_1.48.0.sh) moved to /sw/bioinfo/Mothur/makeroom_1.48.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "Mothur" "-v" "1.48.0" "-f"
    ./makeroom_Mothur_1.48.0.sh


Installing the precompiled Linux 64-bit binaries.

# Download
    cd $SRCDIR
    wget https://github.com/mothur/mothur/releases/download/v${VERSION}/Mothur.linux_7.zip
    unzip Mothur.linux_7.zip 
    cd mothur

# Move to rackham
    mv * $PREFIX



# Test
# Download test files
    mkdir $PREFIX/test
    cd $PREFIX/test
    wget https://mothur.s3.us-east-2.amazonaws.com/wiki/miseqsopdata.zip
    wget https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.bacteria.zip
    wget https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset9_032012.pds.zip
    find -name "*.zip" -exec unzip {} \;


 # Unpack everything into the current directory and run mothur.
    echo mothur "#make.file(inputdir=/sw/bioinfo/Mothur/1.48.0/rackham/test, type=fastq, prefix=stability); make.contigs(file=stability.files); summary.seqs(fasta=stability.trim.contigs.fasta, count=stability.contigs.count_table); screen.seqs(fasta=stability.trim.contigs.fasta, count=stability.contigs.count_table, maxambig=0, maxlength=275, maxhomop=8);summary.seqs(fasta=stability.trim.contigs.good.fasta, count=stability.contigs.good.count_table); summary.seqs(fasta=current, count=current); summary.seqs(count=current); unique.seqs(fasta=stability.trim.contigs.good.fasta, count=stability.contigs.good.count_table); screen.seqs(fasta=stability.trim.contigs.fasta, count=stability.contigs.count_table, maxambig=0, maxlength=275, maxhomop=8); unique.seqs(fasta=stability.trim.contigs.good.fasta, count=stability.contigs.good.count_table)" > test_mothur.sh

bash test_motur.sh


The mf file from 1.40.5 should be fine.



Mothur/1.41.0
=============

<http://www.mothur.org/>

Installing the precompiled Linux 64-bit binaries.

    VERSION=1.41.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/Mothur
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION

    # Do not create $CLUSTER directory, we will instead create this from zipball.

    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://github.com/mothur/mothur/releases/download/v${VERSION}.pre-release/Mothur.linux_64.zip
    unzip Mothur.linux_64.zip 

    # get rid of unfortunate Mac traces in the zipball

    rm -rf __MACOSX
    find . -name .DS_Store -exec rm -f {} \;
    mv mothur ../$CLUSTER


The mf file from 1.40.5 should be fine.
