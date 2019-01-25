Kraken 0.10.5-beta
==================

    cd /sw/apps
    cd bioinfo/
    mkdir Kraken
    cd Kraken/
    mkdir 0.10.5-beta
    mkdir mf
    cd 0.10.5-beta/
    mkdir milou src
    cd src/
    wget https://ccb.jhu.edu/software/kraken/dl/kraken-0.10.5-beta.tgz
    tar xzf kraken-0.10.5-beta.tgz 
    cd kraken-0.10.5-beta/
    cd scripts/

Change all the Perl script #! lines to '#!/usr/bin/env perl'.

    vi *pl kraken kraken-*

It requires jellyfish 1.

    module load gcc/4.9.2
    module load bioinfo-tools
    module load jellyfish/1.1.11

    export KRAKEN_DIR=/sw/apps/bioinfo/Kraken/0.10.5-beta/milou
    ./install_kraken.sh $KRAKEN_DIR

Now build the Kraken database.  I have set up a cron-ready script to do this, Kraken-update-db.sh

    export PATH=/sw/apps/bioinfo/Kraken/0.10.5-beta/milou:$PATH
    cd /sw/data/uppnex/
    mkdir Kraken
    cd Kraken/
    mkdir 20151201
    cd 20151201/
    export KRAKEN_DB=$PWD

    module load jellyfish/1.1.11
    kraken-build --standard --threads 8 --db $KRAKEN_DB

Now create mf file with warning about loading Kraken DB properly.


Monthly database downloads
--------------------------

I have produced a script to be run on cron, to do database downloads (I am
choosing monthly).  Downloads are being saved to /sw/data/uppnex/Kraken, and
the script `Kraken-update-db.sh` is there as well.

New developments
----------------

After my initial installation and database fetch, NCBI changed the locations of
the bacterial and other files, and they are now archived and it is requested
that they are fetched dynamically now.  I and another user informed the Kraken
developer (<https://github.com/DerrickWood/kraken/issues/33>), and a new
download_genomic_library.sh script was produced.  It is a temporary fix:

> I've made a change to the download_genomic_library.sh file to point to the
archived set of bacterial sequences, which will fix things in the short term.
I'm working on a better solution that will allow inclusion of newer sequences
as well (that lack GI numbers but have only accession numbers).

So I have saved off the original and downloaded the new version.

    /sw/apps/bioinfo/Kraken/0.10.5-beta/src/kraken-0.10.5-beta/scripts $ mv download_genomic_library.sh download_genomic_library_orig.sh
    /sw/apps/bioinfo/Kraken/0.10.5-beta/src/kraken-0.10.5-beta/scripts $ wget https://raw.githubusercontent.com/DerrickWood/kraken/master/scripts/download_genomic_library.sh

