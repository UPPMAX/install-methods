EnsEMBL-API 87
==============

Perl API for accessing EnsEMBL resources.  Each is tied to a specific EnsEMBL release.

<http://www.ensembl.org/info/docs/api/index.html>

LOG
---

There is no src directory per se, we put the tarballs there afterward.


    VERSION=87
    CKUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir EnsEMBL-API
    cd EnsEMBL-API/
    mkdir $VERSION
    cd $VERSION
    module load perl/5.18.4
    module load perl_modules/5.18.4
    module load bioinfo-tools
    module load BioPerl/1.6.924_Perl5.18.4
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD
    git clone https://github.com/samtools/tabix.git
    cd tabix
    make
    cd perl
    perl Makefile.PL PREFIX=$P
    make && make install
    cd $P
    wget ftp://ftp.ensembl.org/pub/ensembl-api.tar.gz
    wget https://github.com/Ensembl/ensembl-io/archive/release/87.zip
    tar xzf ensembl-api.tar.gz 
    unzip 87.zip 

Are there any differences between the contents of the `ensembl-io` directory from `ensembl-api.tar.gz` and `ensembl-io-release-87` from `87.zip`?

    diff -W $COLUMNS -y <(find ensembl-io -type f -exec md5sum {} \; | cut -f1 -d' ' | sort) <(find ensembl-io-release-87 -type f -exec md5sum {} \; | cut -f1 -d' ' | sort)

Nope.  Use the one from release 87.

    rm -rf ensembl-io
    mv ensembl-io-release-87 ensembl-io

Stash tarballs.

    mv ensembl-api.tar.gz 87.zip ../src_$CLUSTER

Create mf from BioPerl mf.

