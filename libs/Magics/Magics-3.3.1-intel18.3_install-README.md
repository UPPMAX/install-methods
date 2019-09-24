Magics/3.3.1-intel18.3
======================

built with intel/18.3

<https://confluence.ecmwf.int/display/MAGP/Magics>

Used under license:


Structure creating script (makeroom_Magics_3.3.1-intel18.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/Magics/makeroom_3.3.1-intel18.3.sh

LOG
---

    TOOL=Magics
    TOOLVERSION=3.3.1
    INTELVERSION=18.3
    VERSION=${TOOLVERSION}-intel${INTELVERSION}
    makeroom.sh -t $TOOL -v $VERSION -c libs -w https://confluence.ecmwf.int/display/MAGP/Magics -d "Latest generation of the ECMWF's meteorological plotting software" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/libs/$TOOL
    source SOURCEME_${TOOL}_${VERSION}
    cd ${VERSION}
    cd src/
    wget https://confluence.ecmwf.int/download/attachments/3473464/${TOOL}-${TOOLVERSION}-Source.tar.gz?api=v2
    mv ${TOOL}-${TOOLVERSION}-Source.tar.gz\?api\=v2 ${TOOL}-${TOOLVERSION}-Source.tar.gz
    tar xzf ${TOOL}-${TOOLVERSION}-Source.tar.gz 
    cd ${TOOL}-${TOOLVERSION}-Source/
    PYTHONUSERBASE=$PREFIX pip install --user jinja2
    export PYTHONPATH=$PREFIX/lib/python2.7/site-packages:$PYTHONPATH
    module load git/2.21.0
    module load cmake/3.13.2
    module load intel/$INTELVERSION
    module load netcdf/4.7.1-intel${INTELVERSION}
    module load hdf5/1.10.5-intel${INTELVERSION}
    module load szip/2.1.1
    module load zlib/1.2.11
    module load OpenJPEG/2.3.0
    module load PROJ.4/4.9.3-intel${INTELVERSION}
    module load ecCodes/2.13.1-intel${INTELVERSION}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_GEOTIFF=OFF -DENABLE_NETCDF=ON -DNETCDF_PATH=$NETCDF_ROOT -DCMAKE_BUILD_TYPE=Release -DECCODES_PATH=$ECCODES_ROOT -DECCODES_LIBRARIES=$ECCODES_ROOT/lib/libeccodes.so -DENABLE_CAIRO=ON -DPROJ4_PATH=$PROJ4_ROOT

    make
    make install

