GATK/3.8-0
==========

<https://software.broadinstitute.org/gatk/download/>


LOG
---

Licence agreement accepted.  No cluster-specific subdirectory for GATK.

    VERSION=3.8-0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/GATK
    mkdir $VERSION
    cd $VERSION

Brought over the tarball after downloading on office mac.

    mkdir src
    cd src
    cp -av ~/uppmax/GenomeAnalysisTK-3.8-0.tar.bz2 .
    tar xjvf GenomeAnalysisTK-3.8-0.tar.bz2 
    mv GenomeAnalysisTK-3.8-0-ge9d806836/GenomeAnalysisTK.jar ..
    rmdir GenomeAnalysisTK-3.8-0-ge9d806836
    cd ../..
    fixup -g 3.8-0

