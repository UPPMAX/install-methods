netcdf/4.9.2
============

<https://www.unidata.ucar.edu/software/netcdf/>

Used under license:
Custom AS-IS
<https://www.unidata.ucar.edu/software/netcdf/copyright.html>

Structure creating script (makeroom_netcdf_4.9.2.sh) moved to /sw/libs/netcdf/makeroom_4.9.2.sh

LOG
---

    makeroom.sh "-f" "-c" "libs" "-t" "netcdf" "-v" "4.9.2" "-w" "https://www.unidata.ucar.edu/software/netcdf/" "-d" "a set of software libraries and machine-independent data formats that support the creation, access, and sharing of array-oriented scientific data" "-l" "Custom AS-IS" "-L" "https://www.unidata.ucar.edu/software/netcdf/copyright.html"
    ./makeroom_netcdf_4.9.2.sh
    source /sw/libs/netcdf/SOURCEME_netcdf_4.9.2
    cd $SRCDIR

    ml gcc/10.3.0
    ml bzip2/1.0.8
    ml xz/5.2.6
    ml zlib/1.2.12
    ml cmake/3.22.2
    ml hdf5/1.14.0
    ml libcurl/7.85.0
    ml zstd/1.5.2

    wget https://downloads.unidata.ucar.edu/netcdf-c/4.9.2/netcdf-c-4.9.2.tar.gz

    tar xf netcdf-c-4.9.2.tar.gz

    cd netcdf-c-4.9.2
    mkdir build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_NETCDF_4=ON -DBUILD_UTILITIES=ON -DBUILD_SHARED_LIBS=ON -DENABLE_TESTS=ON -DBz2_INCLUDE_DIRS:PATH=$BZIP2_ROOT/include -DBz2_RELEASE_LIBRARY:FILEPATH=$BZIP2_ROOT/lib/libbz2.so -DSzip_INCLUDE_DIRS:PATH=$SZIP_ROOT/include -DSzip_RELEASE_LIBRARY:FILEPATH=$SZIP_ROOT/lib/libsz.so -DZstd_INCLUDE_DIRS:PATH=$ZSTD_ROOT/include


     make
     make test
     make install


Now the netcdf-fortran part.

     cd $SRCDIR
     wget https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.5.4.tar.gz
     tar xf v4.5.4.tar.gz
     cd netcdf-fortran-4.5.4/
     mkdir build
     cd build
     export NCDIR=$PREFIX

     cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release  -DBUILD_SHARED_LIBS=ON -DENABLE_TESTS=ON

     make
     make test
     make install


Now set up the mf file.

