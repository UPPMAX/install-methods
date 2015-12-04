# MaSuRCA-2.2.1-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    MaSuRCA assembler 2.2.1

DESCRIPTION
-----------

    WGS assembler for varied DNA sequence data

    Zimin, A. et al. The MaSuRCA genome Assembler. Bioinformatics (2013). 
    doi:10.1093/bioinformatics/btt476

WEBSITE
-------

    http://www.genome.umd.edu/masurca.html

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/MaSuRCA/2.2.1/$Cluster/bin to PATH

LOG
===

    TOOL=/sw/apps/bioinfo/MaSuRCA
    VERSION=2.2.1
    CLUSTER=milou
    mkdir -p $TOOL/$VERSION/$CLUSTER

    # Full tool directory for the cluster is $TOOL/$VERSION/$CLUSTER

    cd $TOOL/$VERSION
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA-2.2.0.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/MaSuRCA_QuickStartGuide.pdf
    cd $CLUSTER
    tar xvzf ../MaSuRCA-2.2.0.tar.gz

    # move contents up one level so base directory is under $VERSION/$CLUSTER

    cd MaSuRCA-2.2.0
    mv * ..
    cd ..
    rmdir MaSuRCA-2.2.0
    cd ..
    mkdir src
    mv MaSuRCA-2.2.0.tar.gz src

MaSuRCA 2.2.0 uses only jellyfish 2.0.  Modify ./configure lines for 
jellyfish to link with the static version of the jellyfish library.  
Add --enable-static --disable-shared to the jellyfish configure.

    vi install.sh
    cp install.sh ../milou-specific-install.sh


Also, a jellyfish header requested .cbegin() and .cend() methods of a 
string object, so I am using gcc/4.8.2 to compile it.

    module load gcc/4.8.2
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

This probably won't work effectively anyway because some test file is missing,
so restart from the tarball.


Full instructions for running MaSuRCA are available in
$TOOL/$VERSION/MaSuRCA_QuickStartGuide.pdf

In brief, use MaSuRCA, users create a configuration file, and then run a Perl
script on the configuration file to create an assemble.sh script that will
then perform the assembly.

An example configuration file is 

    $TOOL/$VERSION/$CLUSTER/sr_config_example.txt

Unlike the previous version, MaSuRCA 2.2.0 determines paths to its toolset
using the path to the configuration script, so these no longer need to be in
the configuration file and are no longer in the example configuration file. 

Modify the configuration file with the locations and statistics of your read
files, and any other parameter modifications necessary.  Then use the MaSuRCA
Perl script, which can be found because the bin/ directory has been added to
the user's PATH.  The name of this script has changed from 2.0.3.1:

    masurca my-configuration-file.txt

This creates assemble.sh.  To run MaSuRCA:

    ./assemble.sh

Douglas Scofield (douglas.scofield@ebc.uu.se) has produced an Uppmax-local
version of the masurca script for reading configuration files that uses
node-local scratch space wherever possible.
