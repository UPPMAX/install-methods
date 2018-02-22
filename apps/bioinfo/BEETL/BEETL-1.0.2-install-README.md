BEETL/1.0.2
===========

BEETL sequence database tool

Markus J. Bauer, Anthony J. Cox and Giovanna Rosone
Lightweight BWT Construction for Very Large String Collections.
Proceedings of CPM 2011, pp.219-231

<https://github.com/BEETL/BEETL>

LOG
---

    TOOL=/sw/apps/bioinfo/BEETL
    VERSION=1.0.2
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir mf
    cd $TOOLDIR
    mkdir src
    cd src
    #git clone https://github.com/BEETL/BEETL.git
    cd BEETL/

Now to build... use new build tools but eventually module load build-tools
will load these.

    export PATH=/sw/comp/m4/1.4.17/milou/bin:/sw/comp/autoconf/2.69/milou/bin:/sw/comp/automake/1.14.1/milou/bin:$PATH
    module load gcc/4.8.3
    module load boost/1.55.0_gcc4.8.3
    module load bioinfo-tools
    module load SeqAn/1.4.2

Remove a 'const' keyword from a friend function.  It is at the
end of line 73:

    vi +73 src/libzoo/io/FastOFStream.hh 
    
    ./configure --with-seqan=/sw/apps/bioinfo/SeqAn/1.4.2/milou --with-boost=$BOOST_ROOT --prefix=$CLUSTERDIR
    make
    make check
    make install

Steal an mf from another project, we need to add $CLUSTERDIR/bin to PATH and load boost/1.55.0.

    cd ../../../mf
    cp /sw/apps/bioinfo/SeqAn/mf/1.4.2 1.0.2
    vi 1.0.2

