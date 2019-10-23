Magics/3.3.1
============

<https://confluence.ecmwf.int/display/MAGP/Magics>

Used under license:


Structure creating script (makeroom_Magics_3.3.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/Magics/makeroom_3.3.1.sh

LOG
---

    TOOL=Magics
    VERSION=3.3.1
    makeroom.sh -t $TOOL -v $VERSION -c libs -w https://confluence.ecmwf.int/display/MAGP/Magics -d "Latest generation of the ECMWF's meteorological plotting software" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/libs/$TOOL
    source SOURCEME_${TOOL}_${VERSION}
    cd ${VERSION}
    cd src/
    wget https://confluence.ecmwf.int/download/attachments/3473464/${TOOL}-${VERSION}-Source.tar.gz?api=v2
    mv ${TOOL}-${VERSION}-Source.tar.gz\?api\=v2 ${TOOL}-${VERSION}-Source.tar.gz
    tar xzf ${TOOL}-${VERSION}-Source.tar.gz 
    cd ${TOOL}-${VERSION}-Source/
    module load git/2.21.0
    module load cmake/3.13.2
    module load boost/1.66.0
    module load hdf5/1.10.5
    module load netcdf/4.7.1
    module load szip/2.1.1
    module load zlib/1.2.11
    module load OpenJPEG/2.3.0
    module load PROJ.4/4.9.3
    module load libgeotiff/1.4.3
    module load ecCodes/2.13.1
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBoost_NO_BOOST_CMAKE -DENABLE_GEOTIFF=ON -DGEOTIFF_PATH=$LIBGEOTIFF_ROOT -DENABLE_NETCDF=ON -DNETCDF_PATH=$NETCDF_ROOT -DCMAKE_BUILD_TYPE=Release -DECCODES_PATH=$ECCODES_ROOT -DECCODES_LIBRARIES=$ECCODES_ROOT/lib/libeccodes.so -DENABLE_CAIRO=ON -DPROJ4_PATH=$PROJ4_ROOT

    make
    make install

