hdf5/1.14.0
===========

<https://www.hdfgroup.org/solutions/hdf5/>

Used under license:
HDF5 License
<https://www.hdfgroup.org/licenses/#>

Structure creating script (makeroom_hdf5_1.14.0.sh) moved to /sw/libs/hdf5/makeroom_1.14.0.sh

LOG
---

    makeroom.sh "-f" "-c" "libs" "-t" "hdf5" "-v" "1.14.0" "-w" "https://www.hdfgroup.org/solutions/hdf5/" "-d" "high performance data software library and file format" "-l" "HDF5 License" "-L" "https://www.hdfgroup.org/licenses/#"
    ./makeroom_hdf5_1.14.0.sh
    source /sw/libs/hdf5/SOURCEME_hdf5_1.14.0
    cd $SRCDIR


    wget https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_${VERSION//./_}/src/hdf5-${VERSION}.tar.bz2
    wget https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_${VERSION//./_}/src/hdf5-${VERSION}.sha256
    sha256sum -c hdf5-${VERSION}.sha256 2>/dev/null | grep -F "hdf5-${VERSION}.tar.bz2"


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

