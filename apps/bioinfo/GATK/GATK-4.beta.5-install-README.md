GATK/4.beta.5
==========

Beta version, will not be the default version.

<https://software.broadinstitute.org/gatk/download/beta>


LOG
---

Licence agreement accepted.  No cluster-specific subdirectory for GATK.

    VERSION=4.beta.5
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/GATK
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src

Bring over the zipfile after downloading off Uppmax.

    unzip gatk-${VERSION}.zip
    mv GenomeAnalysisTK-3.8-0-ge9d806836/GenomeAnalysisTK.jar ..
    rmdir GenomeAnalysisTK-3.8-0-ge9d806836
    cd ../..
    fixup -g 4.beta.5

