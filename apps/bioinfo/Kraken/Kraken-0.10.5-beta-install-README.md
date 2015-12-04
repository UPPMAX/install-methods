
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
