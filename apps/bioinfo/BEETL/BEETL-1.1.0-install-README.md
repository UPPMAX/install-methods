BEETL/1.1.0
===========

BEETL sequence database tool

Markus J. Bauer, Anthony J. Cox and Giovanna Rosone
Lightweight BWT Construction for Very Large String Collections.
Proceedings of CPM 2011, pp.219-231

<https://github.com/BEETL/BEETL>

LOG
---

    TOOL=BEETL
    VERSION=1.1.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOLDIR=/sw/apps/bioinfo/$TOOL
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    mkdir -p $PFX
    [[ $CLUSTER == rackham ]] && for C in bianca irma; do ln -s $CLUSTER $C; done
    mkdir src
    cd src
    [[ -d $TOOL ]] && rm -rf $TOOL
    git clone https://github.com/$TOOL/$TOOL.git
    cd $TOOL
    module load gcc/4.8.3
    module load autoconf/2.69 automake/1.14.1 m4/1.4.17
    module load boost/1.55.0_gcc4.8.3
    module load bioinfo-tools SeqAn/1.4.2

Remove a 'const' keyword from a friend function.  It is at the
end of line 73:

    vi +73 src/libzoo/io/FastOFStream.hh 

Build and install

    ./configure --with-seqan=/sw/apps/bioinfo/SeqAn/1.4.2/$CLUSTER --with-boost=$BOOST_ROOT --prefix=$PFX
    make
    make check
    make install

