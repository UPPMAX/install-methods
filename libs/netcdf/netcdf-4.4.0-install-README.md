netcdf 4.4.0
============

<http://www.unidata.ucar.edu/software/netcdf/>

NetCDF is a set of software libraries and self-describing, machine-independent
data formats that support the creation, access, and sharing of array-oriented
scientific data.

LOG
---

Building this was a pain.  I was not able to get it recognised as a format by
GDAL.  Since there's already 4.3.0 available for tintin, I'll just stop here
and leave this for milou only.

After setting $LDFLAGS, manually completed some builds didn't work because it
couldn't find the hdf5 libraries.  one of the issues was being unable to find
szlib, which was expected to be in 2.1 rather than 2.1_gcc4.9.2.

There is more to be edited here (several months later) but I don't have time now.

    cd /sw/libs
    cd netcdf/
    VERSION=4.4.0
    echo $CLUSTER
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir -p src
    mkdir $CLUSTER
    cd src
    wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-${VERSION}.tar.gz
    tar xzf netcdf-${VERSION}.tar.gz
    mv netcdf-$VERSION netcdf-$VERSION-$CLUSTER
    cd netcdf-$VERSION-$CLUSTER

    module load gcc/4.9.2
    module load zlib/1.2.8
    module load xz/5.2.2
    module load bzip2/1.0.6
    module load hdf5/1.8.16_gcc4.9.2
    ./configure --prefix=/sw/libs/netcdf/$VERSION/$CLUSTER 
    make -j 4
    echo $LD_RUN_PATH

    export LDFLAGS="-L/sw/libs/hdf5/1.8.16_gcc4.9.2/milou/lib"
    make -j 4

    strings /sw/libs/hdf5/1.8.16_gcc4.9.2/milou/lib/libhdf5_hl.a | grep 'H5P_CLS_' | head
    strings /sw/libs/hdf5/1.8.16_gcc4.9.2/milou/lib/libhdf5_hl.so | grep 'H5P_CLS_' | head

    vi libtool 

Maybe edit libtool?  See source directory if it was edited.  In any event, link some tools directly.

    cd /sw/libs/netcdf/4.4.0/src/netcdf-4.4.0-milou/ncgen3
    strings /sw/libs/hdf5/1.8.16_gcc4.9.2/milou/lib/libhdf5_hl.so | grep 'H5LTopen_file_image'
    /bin/sh ../libtool  --tag=CC   --mode=link gcc  -g -O2   -o ncgen3 main.o load.o escapes.o getfill.o init.o genlib.o ncgentab.o ../liblib/libnetcdf.la  $LDFLAGS -lhdf5 -lhdf5_hl -ldl -lm -lcurl
    /bin/sh ../libtool  --tag=CC   --mode=link gcc  -g -O2   -o ncgen3 main.o load.o escapes.o getfill.o init.o genlib.o ncgentab.o ../liblib/libnetcdf.la  -lhdf5 -lhdf5_hl -ldl -lm -lcurl

Turns out it must have szip's version directory name as 2.1.

    module load szip/2.1_gcc4.9.2
    pushd .
    cd /sw/libs/szip/
    ln -s 2.1_gcc4.9.2 2.1
    popd

    /bin/sh ../libtool  --tag=CC   --mode=link gcc  -g -O2   -o ncgen3 main.o load.o escapes.o getfill.o init.o genlib.o ncgentab.o ../liblib/libnetcdf.la  $LDFLAGS -lhdf5 -lhdf5_hl -ldl -lm -lcurl
    ldd .libs/ncgen3

    cd ..

    make
    cd ncgen
    /bin/sh ../libtool  --tag=CC   --mode=link gcc  -g -O2   -o ncgen generate.o main.o cdata.o bindata.o genchar.o cvt.o data.o debug.o escapes.o genc.o genbin.o generr.o genlib.o getfill.o odom.o offsets.o semantics.o dump.o util.o bytebuffer.o list.o genf77.o f77data.o genj.o jdata.o nc_iter.o ConvertUTF.o ncgeny.o ../liblib/libnetcdf.la $LDFLAGS -lhdf5_hl -lhdf5 -ldl -lm -lcurl
    cd ..
    cd ncdump
    /bin/sh ../libtool  --tag=CC   --mode=link gcc  -g -O2   -o nccopy nccopy.o nciter.o chunkspec.o utils.o dimmap.o ../liblib/libnetcdf.la $LDFLAGS -lhdf5_hl -lhdf5 -ldl -lm -lcurl
    cd ..
    make
    make install

