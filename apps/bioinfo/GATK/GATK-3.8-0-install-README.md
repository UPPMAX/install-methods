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

Get all the mf stuff installed.

(Added 2018-07-19) Install `gatk.py` wrapper from [bioconda](https://github.com/bioconda/bioconda-recipes/tree/master/recipes/gatk) to assist in running GATK from the command line.
Make sure that `PATH` is set in the mf file.

    wget https://raw.githubusercontent.com/bioconda/bioconda-recipes/master/recipes/gatk/gatk.py
    chmod +x gatk.py

Now, change the `-Xmx` default in the script to `-Xmx5g`.  Leafe the `-Xms512m` default unchanged.

    ln -s gatk.py GenomeAnalysisTK
    ln -s gatk.py gatk

    module load GATK/$VERSION
    gatk --help

