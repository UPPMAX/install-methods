# jellyfish-2.2.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Jellyfish 2.2.3

DESCRIPTION
-----------

    K-mer counting program for NGS read data

    Guillaume Marcais and Carl Kingsford. 2011.  A fast, lock-free approach for
    efficient parallel counting of occurrences of k-mers. Bioinformatics (2011)
    27(6): 764-770.  doi:10.1093/bioinformatics/btr011

WEBSITE
-------

    http://www.cbcb.umd.edu/software/jellyfish/

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/jellyfish/2.2.3-dev/$Cluster/bin to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/jellyfish
    MF_DIR=$TOOL/mf
    mkdir -p $MF_DIR
    VERSION=2.2.3-dev
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    SOURCEDIR=$VERSIONDIR/src
    mkdir -p $SOURCEDIR
    cd $SOURCEDIR

Get yaggo tool, needed for compiling, and add it to the path.

    git clone https://github.com/gmarcais/yaggo
    cd yaggo
    make
    export PATH=$PWD:$PATH

One more tweak is necessary while we are in the yaggo directory.  The bindings
are developed for Python3.  The appear to work for Python2 (one test fails
'from collections import Counter') but since support is for Python3, I will not
attempt to build python 2 versions.  Unfortunately, this means that I have to
hack a 'python' executable name because our python3 modules do not provide
python, so make a link from the python/3.4.3 executable to python in the yaggo
directory.  Why yaggo?  We already added it to our path above.

    module load python/3.3.1
    ln -sf $(which python3) python

Get docs.  I wondered whether the Git tree would have updated docs
(https://github.com/gmarcais/Jellyfish.git).  Well 'make' in the doc/ directory
(after loading the texlive module) built a today-dated copy of the docs for
jellyfish 1.1.4.  The 'UserGuide.lyx' github entry has a note for adding the
'mem' subcommand, and this is not in the built version. So the above, which
fetches an older (Dec 2013) version of the Jellyfish 2 doc will have to do.

    cd $SOURCEDIR
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
    mv JellyfishUserGuide.pdf $CLUSTERDIR/jellyfish-manual-${VERSION}.pdf

Get Jellyfish development branch.

    cd $SOURCEDIR
    git clone -b develop https://github.com/gmarcais/Jellyfish.git
    cd Jellyfish

-----------------skip below
If we were to get straight 2.2.3 (WHICH WE ARE NOT!) then use system gcc (4.4.1),
system perl (5.10.1) and do not use internal build/ directory.

    cd $SOURCEDIR
    VERSION=2.2.3
    module load python/3.3.1 swig/3.0.7
    ln -sf $(which python3) python
    export PATH=$PWD:$PATH
    wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.3/jellyfish-${VERSION}.tar.gz
    tar xvzf jellyfish-${VERSION}.tar.gz 
    cd jellyfish-${VERSION}/
    ./configure --prefix=$CLUSTERDIR --enable-python-binding=$CLUSTERDIR/python3 --enable-perl-binding=$CLUSTERDIR/perl5
    make -j 4
    make check
    make install
-----------------skip above

Make sure `g++` is at least 4.4, and load SWIG.  'autoreconf -i' needs to be
run, but it will not work with the newer build-tools module (missing variable
def).


Now (should be within the git repository):

    module load gcc/4.8.3 swig/3.0.7 perl/5.18.4
    autoreconf -i
    mkdir build
    cd build
    ../configure --prefix=$CLUSTERDIR --enable-swig --enable-python-binding=$CLUSTERDIR/python3 --enable-perl-binding=$CLUSTERDIR/perl5
    make -j 4
    make check
    make install

Make it available for halvan and nestor.

    cd $VERSIONDIR
    ln -s ./$CLUSTER halvan
    ln -s ./$CLUSTER nestor

The previous `mf` file is incomplete for this version, we need to add the
bindings directories to PYTHONPATH and PERL5LIB.  The rest is OK, the
directories for the gcc/4.8.3 libraries need to be found and also the man page.

    cd $MF_DIR
    cp 2.1.4 $VERSION
    vi $VERSION

Each set of bindings has a separate library, so add:

    append-path     PYTHONPATH        $modroot/python3
    append-path     LD_LIBRARY_PATH   $modroot/python3/jellyfish
    append-path     PERL5LIB          $modroot/perl5
    append-path     LD_LIBRARY_PATH   $modroot/perl5


Set up module definition.

    cd /sw/mf/common/bioinfo-tools/misc/jellyfish/
    cp $MF_DIR/$VERSION .
    chgrp sw $VERSION
    cd ../../../../milou/bioinfo-tools/misc/jellyfish
    ln -sf ../../../../common/bioinfo-tools/misc/jellyfish/$VERSION .
    chgrp -h sw $VERSION

Now repeat it all for tintin.

    TOOL=/sw/apps/bioinfo/jellyfish
    MF_DIR=$TOOL/mf
    mkdir -p $MF_DIR
    VERSION=2.2.3-dev
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=tintin
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    SOURCEDIR=$VERSIONDIR/src
    mkdir -p $SOURCEDIR
    cd $SOURCEDIR
    cd yaggo  # does not need to be rebuilt
    export PATH=$PWD:$PATH
    module load python/3.3.1
    ln -sf $(which python3) python
    cd $SOURCEDIR
    cd Jellyfish
    git clean -fxd
    module load gcc/4.8.3 swig/3.0.7 perl/5.18.4
    autoreconf -i
    mkdir build
    cd build
    ../configure --prefix=$CLUSTERDIR --enable-swig --enable-python-binding=$CLUSTERDIR/python3 --enable-perl-binding=$CLUSTERDIR/perl5
    make -j 4
    make check
    make install
    cd /sw/mf/tintin/bioinfo-tools/misc/jellyfish/
    ln -sf ../../../../common/bioinfo-tools/misc/jellyfish/$VERSION .
    chgrp -h sw $VERSION




Be a good sw group member.

    cd $TOOL
    chgrp -Rh sw *
    chmod -R g+wX,o+rX *
    find . -type d -exec chmod o-w {} \;

