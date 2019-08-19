perl6/rakudo-star-2019.03
=========================

<https://perl6.org>

The latest Perl6, built and installed with the defaults.  Use a more recent
`git/2.10.2` but otherwise use the system `perl` and `gcc`.


LOG
---

    VERSION=rakudo-star-2019.03
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp
    mkdir perl6
    cd perl6
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    wget -O ${VERSION}.tar.gz https://rakudostar.com/latest/star/source
    tar xzf ${VERSION}.tar.gz 
    mv ${VERSION} ${VERSION}_${CLUSTER}
    cd ${VERSION}_${CLUSTER}
    module load git/2.21.0
    perl Configure.pl --gen-moar --prefix $PFX
    make
    make test
    make install

The `make install` completes with:

    Rakudo Star has been built and installed successfully.
    Please make sure that the following directories are in PATH:
      /sw/comp/perl6/rakudo-star-2019.03/rackham/bin
      /sw/comp/perl6/rakudo-star-2019.03/rackham/share/perl6/site/bin

Add those to the mf file.

