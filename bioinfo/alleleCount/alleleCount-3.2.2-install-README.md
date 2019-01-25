# alleleCount-3.2.2-install-README.md

alleleCount
===========

alleleCount: allele counting for BAM/CRAM
<https://github.com/cancerit/alleleCount>

Installation
------------

The install script downloads and installs local copies of samtools and htslib.
The default procedure is to also get Bio::DB::HTS but this fails with system Perl,
probably due to being too old for BioPerl. Besides BioPerl is large enough to want
to skip local copies.

    VERS=3.2.2
    APPL=alleleCount
    INST=/sw/apps/bioinfo/$APPL/$VERS/$CLUSTER
    module load BioPerl/1.6.924_Perl5.18.4
    mkdir -p $INST
    cd /sw/apps/bioinfo/$APPL/$VERS/src
    wget https://github.com/cancerit/alleleCount/archive/v3.2.2.tar.gz
    tar xzf v3.2.2.tar.gz
    cd alleleCount-3.2.2
    ./setup.sh $INST

This takes a while. By default, the script will try to use up to 6 cores.

---
wesleys  
2017-03-01
