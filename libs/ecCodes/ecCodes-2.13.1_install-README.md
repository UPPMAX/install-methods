ecCodes/2.13.1
==============

<https://confluence.ecmwf.int/display/ECC/ecCodes+Home>

Used under license:


Structure creating script (makeroom_ecCodes_2.13.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/ecCodes/makeroom_2.13.1.sh

LOG
---

    TOOL=ecCodes
    VERSION=2.13.1
    cd /sw/libs
    makeroom.sh -t $TOOL -v $VERSION -c libs -w https://confluence.ecmwf.int/display/ECC/ecCodes+Home -d "Provides an application programming interface and a set of tools for decoding and encoding messages in the formats GRIB, BUFR and WMO GTS"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/src/
    wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-${VERSION}-Source.tar.gz?api=v2
    mv eccodes-${VERSION}-Source.tar.gz\?api\=v2 eccodes-${VERSION}-Source.tar.gz
    tar xzf eccodes-${VERSION}-Source.tar.gz 
    cd eccodes-${VERSION}-Source/
    module purge
    module load uppmax
    module load cmake/3.13.2
    module load netcdf/4.7.1
    module load hdf5/1.10.5
    module load OpenJPEG/2.3.0
    module load git/2.21.0
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_NETCDF=ON -DENABLE_JPG=ON -DOPENJPEG_LIBRARY=$OPENJPEG_ROOT/lib/libopenjp2.so.2.3.0 -DOPENJPEG_INCLUDE_DIR=$OPENJPEG_ROOT/include/openjpeg-2.3 -DENABLE_PNG=ON -DENABLE_EXTRA_TESTS=ON -DCMAKE_BUILD_TYPE=Release
    make -j10
    ctest -j10
    make install

