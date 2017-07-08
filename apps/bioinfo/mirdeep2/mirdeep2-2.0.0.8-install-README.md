mirdeep2/2.0.0.8
================

<https://www.mdc-berlin.de/36105849/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep/documentation#top>

LOG
---

    VERSION=2.0.0.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir mirdeep2
    cd mirdeep2
    mkdir $VERSION
    cd $VERSION
    mkdir src_$CLUSTER $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    TOOLVERSION=${VERSION//./_}
    wget https://www.mdc-berlin.de/45995549/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep/mirdeep${TOOLVERSION}.zip
    unzip mirdeep${TOOLVERSION}.zip

The `install.pl` script included lists everything required, but would not be my
preferred method for installing.  Wes worked to figure things out for
`mirdeep2/2.0.0.5`.  The zip includes the squid library in `squid-1.9g.tar.gz`.
This needs to be built in order to build `randfold`.  I will build and install
squid into the module tree, but build randfold referring to the squid source
tree.

    tar xvzf mirdeep${TOOLVERSION}/squid-1.9g.tar.gz
    cd squid-1.9g
    CFLAGS="-O3" ./configure --enable-lfs prefix=$PFX
    make
    make install
    cd ..

Now to make `randfold`, based on the bits in the `install.pl` script.

    wget http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/downloads/randfold-2.0.tar.gz
    tar xvzf randfold-2.0.tar.gz 
    cd randfold-2.0/
    cp Makefile Makefile.orig
    vi Makefile

Edit `LIBS=` and `INCLUDE=` lines of the Makefile to be:

    LIBS=-lm -L../squid-1.9g -lsquid
    INCLUDE=-I. -I../squid-1.9g

Now make it, and make sure it works:

    make
    ./randfold
    mkdir -p $PFX/bin
    cp randfold $PFX/bin/
    cd ..

A few Perl modules are required, which can be provided by base Perl and
`perl_modules/5.18.4`.   Check for them to be sure by using the built-in
Perl debugger:

    module load perl/5.18.4 perl_modules/5.18.4
    perl -d -e 0

and within Perl:

    use Compress:Zlib
    use Font::TTF
    use PDF::API2

If no errors, no problems; `q` to quit from the Perl debugger.

Other requirements are available in existing modules:

* the ViennaRNA package, as `RNAfold/1.8.4`
* bowtie, by loading `bowtie/1.1.2`

Copy the mirdeep2 scripts over now.

    cd mirdeep${TOOLVERSION}
    cp -av src/* $PFX/bin/

Mark the installation as successful.

    touch $PFX/install_successful

