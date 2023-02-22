hdf5/1.10.9
===========

<https://www.hdfgroup.org/downloads/hdf5/>

Used under license:

Mixed

<https://www.hdfgroup.org/licenses>


Structure creating script (makeroom_hdf5_1.10.9.sh) moved to /sw/libs/hdf5/makeroom_1.10.9.sh

LOG
---

    makeroom.sh "-t" "hdf5" "-v" "1.10.9" "-w" "https://www.hdfgroup.org/downloads/hdf5/" "-c" "libs" "-f"
    ./makeroom_hdf5_1.10.9.sh

    source SOURCEME__1.10.9
    cd $SRCDIR

    wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${VERSION%.*}/hdf5-${VERSION}/src/hdf5-${VERSION}.tar.bz2
    wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${VERSION%.*}/hdf5-${VERSION}/src/hdf5-${VERSION}.md5

    # check md5 for this download, should be ok

    md5sum -c hdf5-${VERSION}.md5 2>/dev/null | grep -F "hdf5-${VERSION}.tar.bz2"

    [[ -d hdf5-${VERSION} ]] && rm -rf hdf5-${VERSION}
    tar xf hdf5-${VERSION}.tar.bz2

    cd hdf5-${VERSION}

    module load zlib/1.2.12
    module load szip/2.1.1
    module load gcc/10.3.0

    ./configure --prefix=$PREFIX --enable-threadsafe --enable-unsupported --enable-fortran --enable-cxx --with-szlib=$SZIP_ROOT --with-zlib=$ZLIB_ROOT

    make |& tee make.out
    make check |& tee check.out
    make install
    make installcheck

