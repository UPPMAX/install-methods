fastq_screen/0.11.1
===================

FastQ Screen.

<https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/>

LOG
---

    VERSION=0.11.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/fastq_screen
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/fastq_screen_v${VERSION}.tar.gz
    tar xvzf fastq_screen_v${VERSION}.tar.gz 
    cd fastq_screen_v${VERSION}

Change `#!` line to use `#!/usr/bin/env perl`.

    vi fastq_screen

Now base cluster directory off this

    cd ..
    mv fastq_screen_v${VERSION} ../milou
    cd ..
    ln -s milou rackham
    ln -s milou bianca
    ln -s milou irma

