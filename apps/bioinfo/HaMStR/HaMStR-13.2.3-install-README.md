# HaMStR-13.2.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

HaMStR 13.2.3


DESCRIPTION
-----------

HaMStR : A tool for directed ortholog search in ESTs and proteins


WEBSITE
-------

    http://sourceforge.net/projects/hamstr/


MODULE REQUIREMENTS
-------------------

We need to load a newer perl than the system devault (5.8.8 as of this writing)
because there is a failure with "can't find parent.pm" in BioPerl.  I have also
chosen to go with the locally-provided BioPerl rather than our BioPerl module
because that is how HaMStR is released.  I wrote the developer to see if there is
any reason we cannot use our BioPerl module.  The developer responded:

> Hi Doug,
> 
> there is only one thing special about the BioPerl I am using. I have slightly
> modified the module ProteinStatistics.pm that computes the Kimura protein
> distances. That was it. If you have any problems let me know.
> 
> Best,
> 
> Ingo
> 
> --
> Prof. Dr. Ingo Ebersberger
> Dept. for Applied Bioinformatics
> Inst. for Cell Biology and Neuroscience
> Goethe University
> Max-von-Laue Str. 13
> D-60438 Frankfurt
> Germany
> Phone: +49 69 798 42112
> Fax: +49 69 798 42111
> email: ebersberger@bio.uni-frankfurt.de
> Web: http://www.bio.uni-frankfurt.de/43045195/ak-ebersberger

So I will go ahead and keep using his local BioPerl.  It is only about 60MB in
total anyway.  The complete set of modules we load for this is:

    module load bioinfo-tools
    module load perl/5.18.2
    module load hmmer/3.1b1-gcc
    module load blast/2.2.29+
    module load wise2/2.4.1
    module load clustalw/2.1
    module load MAFFT/7.205
    module load usearch/7.0.1090

Some are not yet available on tintin and I have asked for the directory
permissions and groups to be changed so that I can update the links for the
module system.


LOG
---

All clusters will share the same version, since it is just perl scripts.

    TOOL=/sw/apps/bioinfo/HaMStR
    VERSION=13.2.3
    TOOLDIR=$TOOL/$VERSION
    mkdir -p $TOOLDIR
    cd $TOOLDIR

Download from http://sourceforge.net/projects/hamstr/files/, the full version, not
the bin-lib version.

    wget http://sourceforge.net/projects/hamstr/files/hamstr.v13.2.3.tar.gz
    tar xzf hamstr.v13.2.3.tar.gz

This creates hamstr.v13.2.3/.  Now load the required modules prior to configuring.

    module load bioinfo-tools
    module load perl/5.18.2
    module load hmmer/3.1b1-gcc
    module load blast/2.2.29+
    module load wise2/2.4.1
    module load clustalw/2.1
    module load MAFFT/7.205
    module load usearch/7.0.1090

    cd hamstr.v13.2.3/bin

    ./configure

This adjusts some internal variables in scripts and sets up a symbolic link.  The
tool has a local tmp/ directory here, but I do not think there will be conflicts 
between users because of this because the tmpdir for each run is in the run output
directory, wherever the user specifies that to be.

Now make links for clusters.

    cd $TOOLDIR
    ln -s hamstr.v13.2.3 milou
    ln -s hamstr.v13.2.3 tintin
    ln -s milou nestor

Create mf file and have it add $MAFFT_DIR/$VERSION/$CLUSTER/bin to the user PATH,
and $MAFFT_DIR/share/man to MANPATH.

    mkdir $TOOL/mf
    cd mf
    cp <mf from wherever> 13.2.3

Now just do "prepend-path $modroot/bin".

Some of the prereq modules (wise2/2.4.1, clustalw/2.1) are not yet available on
tintin because I do not have permission to set up the links/mf files.  Waiting on
that.

Be a good application expert.

    cd $TOOL
    chgrp -hR sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rx {} \;

