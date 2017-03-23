szip/2.1.1
==========

<https://www.hdfgroup.org/HDF5/release/obtain5.html>



Log
---

I'm chosing to use the system gcc version for now.

NOTE: While unpacking the tarball we get

    tar: Ignoring unknown extended header keyword `LIBARCHIVE.xattr.security.selinux'
    tar: Ignoring unknown extended header keyword `LIBARCHIVE.xattr.security.selinux'
    tar: Ignoring unknown extended header keyword `LIBARCHIVE.xattr.security.selinux'
    ...

Ignoring.

    TOOLVERSION=2.1.1
    VERSION=${TOOLVERSION}
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir -p szip
    cd szip/
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src
    [[ -f szip-${TOOLVERSION}.tar.gz ]] || wget http://www.hdfgroup.org/ftp/lib-external/szip/$TOOLVERSION/src/szip-${TOOLVERSION}.tar.gz
    tar xzf szip-${TOOLVERSION}.tar.gz
    mv szip-${TOOLVERSION} szip-${VERSION}_${CLUSTER}
    cd szip-${VERSION}_${CLUSTER}
    ./configure --prefix=$P
    make
    make install

