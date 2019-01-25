MaSuRCA/2.1.0
=============

MaSuRCA assembler 2.1.0

WGS assembler for varied DNA sequence data

Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013). 
doi:10.1093/bioinformatics/btt476

<http://www.genome.umd.edu/masurca.html>


LOG
---

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=2.1.0
    CLUSTER=kalkyl

full tool directory for the cluster is $TOOL/$VERSION/$CLUSTER

    mkdir -p $TOOL/$VERSION/$CLUSTER

    cd $TOOL/$VERSION
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA-2.1.0.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA_QuickStartGuide.pdf
    cd $CLUSTER
    tar xvzf ../MaSuRCA-2.1.0.tar.gz

move contents up one level so base directory is under $VERSION/$CLUSTER

    cd MaSuRCA-2.1.0
    mv * ..
    cd ..
    rmdir MaSuRCA-2.1.0
    mkdir src
    mv MaSuRCA-2.1.0.tar.gz src

Now modify the ./configure lines for both jellyfish versions to make them
link with the static version of the jellyfish library.  Add

    --enable-static --disable-shared

to each jellyfish configure.

    ./install.sh

This script does the set of recursive configures and makes for each tool, then
does the install into bin/

    PATH=$TOOL/$VERSION/$CLUSTER/bin:$PATH

Note that rebuilding from scratch requires cleaning up the CA build and removing
the example configuration script:

    rm sr_config_example.txt
    cd CA/kmer; make clean; cd ../src; make clean
    cd ../..
    ./install.sh

Full instructions for running MaSuRCA are available in
$TOOL/$VERSION/MaSuRCA_QuickStartGuide.pdf

In brief, use MaSuRCA, users create a configuration file, and then run a Perl
script on the configuration file to create an assemble.sh script that will
then perform the assembly.

An example configuration file is 

    $TOOL/$VERSION/$CLUSTER/sr_config_example.txt

Unlike the previous version, MaSuRCA 2.1.0 determines paths to its toolset
using the path to the configuration script, so these no longer need to be in
the configuration file and are no longer in the example configuration file. 

Modify the configuration file with the locations and statistics of your read
files, and any other parameter modifications necessary.  Then use the MaSuRCA
Perl script, which can be found because the bin/ directory has been added to
the user's PATH.  The name of this script has changed from 2.0.3.1:

    masurca my-configuration-file.txt

This creates assemble.sh.  To run MaSuRCA:

    ./assemble.sh

