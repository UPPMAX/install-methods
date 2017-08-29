ITSx/1.1-beta
=============

1.1 beta version

ITSx: Improved software detection and extraction of ITS1 and ITS2 from
ribosomal ITS sequences of fungi and other eukaryotes for use in environmental
sequencing.

Johan Bengtsson-Palme, Vilmar Veldre, Martin Ryberg, Martin Hartmann, Sara
Branco, Zheng Wang, Anna Godhe, Yann Bertrand, Pierre De Wit, Marisol Sanchez,
Ingo Ebersberger, Kemal Sanli, Filipe de Souza, Erik Kristiansson, Kessy
Abarenkov, K. Martin Eriksson, R. Henrik Nilsson Methods in Ecology and
Evolution, 4: 914-919, 2013 (DOI: 10.1111/2041-210X.12073)

LOG
---

An executable perl script is distributed with ITSx, good for all clusters.
Unpack the tarball and move the contents to the cluster directory.

    VERSION=1.1-beta
    REMOTEVERSION=1.1b
    UNPACKEDVERSION=1.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir ITSx
    cd ITSx
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget http://microbiology.se/sw/ITSx_${REMOTEVERSION}.tar.gz
    tar xzf ITSx_${REMOTEVERSION}.tar.gz

Change to use `#!/usr/bin/env perl`.

    vi ITSx_${UNPACKEDVERSION}/ITSx

Now copy directory to cluster directory.

    mv ITSx_${UNPACKEDVERSION} ../$CLUSTER

Create links for the other clusters.  If on milou, this does it.

    cd ..
    ln -s milou rackham
    ln -s milou irma
    ln -s milou bianca

For the mf file, load `hmmer/3.1b2` since that is available on all systems.

Also, don't forget to clean up the permissions here.

    cd ../..
    fixup -g ITSx

