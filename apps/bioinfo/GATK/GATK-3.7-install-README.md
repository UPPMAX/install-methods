GATK 3.7
========

<//software.broadinstitute.org/gatk/download/>


LOG
---

Licence agreement accepted.  No cluster-specific subdirectory for GATK.

    VERSION=3.7
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/GATK
    mkdir $VERSION
    cd $VERSION
    tar xjvf ~/uppmax/GenomeAnalysisTK-3.7.tar.bz2 
    cd ..
    fixup -g 3.7
