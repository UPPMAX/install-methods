PhyML/3.3.201903212
===================

<http://www.atgc-montpellier.fr/phyml/>

<https://github.com/stephaneguindon/phyml>

This compiled with `-march=native`, so compile separately for rackham and
snowy/bianca/irma.

There are many separate tools listed in `./configure --help`, only a few of
which compile and/or are mentioned ath the website.  We compile and install
three: `phyml`, `phyrex` and `phytime`.

There is also a phyml mpi executable.


LOG
---


    VERSION=3.3.20190321
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == snowy ]] && mkdir -p $CLUSTER && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src/
    [[ -e v${VERSION}.tar.gz ]] || wget https://github.com/stephaneguindon/phyml/archive/v${VERSION}.tar.gz
    [[ -d phyml-${VERSION} ]] && rm -rf phyml-${VERSION}
    tar xzvf v${VERSION}.tar.gz 
    cd phyml-${VERSION}/
    ./autogen.sh 
    ./configure --prefix=$PFX --enable-phyml && make -j4 && make install && make clean distclean
    ./configure --prefix=$PFX --enable-phyrex && make -j4 && make install && make clean distclean
    ./configure --prefix=$PFX --enable-phytime && make -j4 && make install && make clean distclean

Repeat on snowy-lr1 
