guile/1.8.8
===========

<http://www.gnu.org/software/guile/>

Log
---

    VERSION=1.8.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp
    mkdir guile
    cd guile/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER src
    cd $CLUSTER
    P=$PWD
    cd ../src
    [[ -f guile-${VERSION}.tar.gz ]] || wget ftp://ftp.gnu.org/gnu/guile/guile-${VERSION}.tar.gz
    tar xzf guile-${VERSION}.tar.gz 
    mv guile-${VERSION} guile-${VERSION}-$CLUSTER/
    cd guile-${VERSION}-$CLUSTER/
    module load gcc/5.3.0
    module load build-tools
    module load libtool/2.4.6

This latter is needed to provide `libltdl`, without it `./configure` will error out with

    checking for lt_dlinit in -lltdl... no
    configure: error: libltdl not found.  See README.

Also disable `-Werror` inclusion in the compilation by setting, within `./configure`, at line 12612:

    GUILE_ERROR_ON_WARNING="no"

If you fail to do this, it will fail with something like:

    async.c:243:14: error: variable ‘count’ set but not used [-Werror=unused-but-set-variable]

Continue with configure, and build/install.

    ./configure --prefix=$P
    make -j 8
    make install

Now make sure mf also sets info and aclocal directories.

