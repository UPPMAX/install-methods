# TE-Tracker-20141124-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    TE-Tracker 20141124

    (no official version, this is the date of the downloaded archive)

DESCRIPTION
-----------

    TE-Tracker 20141124

    TE-Tracker: systematic identification of transposition events through
    whole-genome resequencing.  Arthur Gilly, Mathilde Etcheverry, Mohammed-Amin
    Madoui, Julie Guy, Leandro Quadrana, Adriana Alberti, Antoine Martin, Tony
    Heitkam, Stefan Engelen, Karine Labadie, Jeremie Le Pen, Patrick Wincker,
    Vincent Colot and Jean-Marc Aury.  BMC Bioinformatics 2014, 15:377
    doi:10.1186/s12859-014-0377-z.


WEBSITE
-------

    http://www.genoscope.cns.fr/externe/tetracker/

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/TE-Tracker/20141124/$CLUSTER to the user PATH and
    .../perl-packages/perl5/lib to PERL5LIB.

LOG
---

    TOOL=/sw/apps/bioinfo/TE-Tracker
    VERSION=20141124
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    wget http://www.genoscope.cns.fr/externe/tetracker/TE-Tracker.tar.gz
    tar xvzf TE-Tracker.tar.gz
    cp -av * $CLUSTERDIR

This tool contains scripts with a lot of hard-coded perl and python.  I have
changed all these, but there was a lot.

This tool was missing its single-linkage clustering program.  I emailed the
developers and it was sent right away.  Nice!  It is in src/slclust and
milou/slclust.

The tool wants to download and install everything it needs, including picard,
bedtools, and samtools.  Instead, I stomped down most of its install script,
pointed it to our modules, and pointed it at its own slclust.  See
src/install-uppmax.pl for the new install script, and
src/TE-Tracker.conf-as-installed-at-UPPMAX for the config file generated.  Run
this install script in the milou/ directory.  **NOTE THIS IS A DELIBERATELY
OLD SAMTOOLS.**  That is what the tool needs.

    cd $CLUSTERDIR
    module load perl/5.18.2 bioinfo-tools samtools/0.1.12-10 BEDTools/2.21.0 picard/1.118
    ./install-uppmax.pl

Now move the install scripts out of the user-visible directory, and copy the
config file just in case.

    cp install.pl install-uppmax.pl ../src/
    cp TE-Tracker.conf ../src/TE-Tracker.conf-as-installed-at-UPPMAX

    cd $VERSIONDIR
    ln -s ./milou tintin
    ln -s ./milou halvan
    ln -s ./milou nestor

The mf file is straightforward, see MODULE REQUIREMENTS above.

