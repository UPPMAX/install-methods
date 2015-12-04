# QuantiSNP-2.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    QuantiSNP 2.3

DESCRIPTION
-----------

    QuantiSNP 2.3

    Colella, S.,* Yau, C.,* Taylor, J.M., Mirza, G., Butler, H., Clouston, P.,
    Basset, A.S., Seller, A., Holmes, C., and Ragoussis, J.  2007.  QuantiSNP: an
    Objective Bayes Hidden-Markov Model to detect and accurately map copy number
    variation using SNP genotyping data. Nucleic Acids Research, 35(6):2013-2025.

WEBSITE
-------

    https://sites.google.com/site/quantisnp/home

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/cnD/1.3/$CLUSTER/quantisnp/linux64 to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/QuantiSNP
    VERSION=2.3
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p install_files
    cd install_files
    # MATLAB runtime
    wget ftp://ftp.stats.ox.ac.uk/pub/yau/quantisnp2/mcr/MCRinstaller64.run
    # QuantiSNP 2.3 program
    wget ftp://ftp.stats.ox.ac.uk/pub/yau/quantisnp2/executables/09042010/install_quantisnp
    # GC content files
    CD $VERSIONDIR
    mkdir gc
    cd gc
    wget ftp://ftp.stats.ox.ac.uk/pub/yau/quantisnp2/download/b37.tar.gz

Install the MATLAB runtime.

    cd $VERSIONDIR/install_files
    sh MCRinstaller64.run

It is an install script that looks a lot like older Windows install scripts.
Set the install dir to be $VERSIONDIR/MATLAB/MATLAB_Compiler_Runtime.

Install the QuantiSNP program.

    cd $VERSIONDIR/install_files
    sh install_quantisnp

Set the install directory to be $CLUSTERDIR.  This will ultimately install the
files of interest to $CLUSTERDIR/quantisnp/linux64.  We need to rename some
files.

    cd $CLUSTERDIR/quantisnp/linux64
    mv quantisnp2 quantisnp2_exec
    mv run_quantisnp2.sh quantisnp2

And then edit quantisnp2 (a sh script) so that instead of getting the MATLAB
runtime as an argument, it points directly to
$VERSIONDIR/MATLAB/MATLAB_Compiler_Runtime/v79, and points to quantisnp2_exec
to run, and also only contains the options needed for linux 64-bit.

Make sure to announce the location of the local GC content files when the
module is loaded, which is $VERSIONDIR/gc.

We should be able to run the same version on tintin.
