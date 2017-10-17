MaSuRCA/2.0.3.1
===============

MaSuRCA assembler

WGS assembler for varied DNA sequence data

Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013). 
doi:10.1093/bioinformatics/btt476

<http://www.genome.umd.edu/masurca.html>

LOG
---

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=2.0.3.1
    CLUSTER=kalkyl

full tool directory for the cluster is $TOOL/$VERSION/$CLUSTER

    mkdir -p $TOOL/$VERSION/$CLUSTER

    cd $TOOL/$VERSION
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA-2.0.3.1.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA_QuickStartGuide.pdf
    cd $CLUSTER
    tar xvzf ../MaSuRCA-2.0.3.1.tar.gz

move contents up one level so base directory is under $VERSION/$CLUSTER

    cd MaSuRCA-2.0.3.1
    mv * ..
    cd ..
    rmdir MaSuRCA-2.0.3.1

The install script does a decent job of handling --prefix= for its subsidiary 
tools, and I seem to recall making some modifications to either it or one of the
scripts in the CA/ subdirectory for the Celera Assembler, but I can't find any 
differences between this source tree and the unpacked archive... something to do
with the proper version of gcc/g++ ... oh wait that was on another machine, but
in any event, it might be required because of the heterogeneous manner in which
the build environment is managed in this collection of tools.  Glad nothing
further is required here.

    ./install.sh

This script does the set of recursive configures and makes for each tool, then
does the install into bin/

PATH=$TOOL/$VERSION/$CLUSTER/bin:$PATH


Full instructions are available in $TOOL/$VERSION/MaSuRCA_QuickStartGuide.pdf

In brief, use MaSuRCA, users create a configuration file, and then run a Perl script
on the configuration file to create an assemble.sh script that will then perform 
the assembly.

An example configuration file is 

    $TOOL/$VERSION/$CLUSTER/sr_config_example.txt

MaSuRCA 2.0.3.1 requires full paths to the MaSuRCA installation so those are 
visible in the example configuration file.  Modify the configuration file with the
locations and statistics of your read files, and any other parameter modifications
necessary.  Then use the MaSuRCA Perl script, found because the bin/ directory has
been added to the user's PATH:

    runSRCA.pl my-configuration-file.txt

This creates assemble.sh.  To run MaSuRCA:

    ./assemble.sh

