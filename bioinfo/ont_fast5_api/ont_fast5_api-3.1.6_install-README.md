ont_fast5_api/3.1.6
===================

<https://github.com/nanoporetech/ont_fast5_api>

Used under license:
Mozilla Public License 2.0

Structure creating script (makeroom_ont_fast5_api_3.1.6.sh) moved to /sw/bioinfo/ont_fast5_api/makeroom_3.1.6.sh

LOG
---

    TOOL=ont_fast5_api
    VERSION=3.1.6
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/nanoporetech/ont_fast5_api -l "Mozilla Public License 2.0" -d "simple interface to HDF5 files of the Oxford Nanopore .fast5 file format" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    PYTHONUSERBASE=$PREFIX pip install --user ont-fast5-api==${VERSION}
    cd mf
    cp ../../MultiQC/mf/1.9 ${VERSION} 

Edit mf file to change `MultiQC` to `ont_fast5_api`

    vi ${VERSION}

Edit post-install to load my own link to uppmax functions, and use it.

    cd ..
    vi ../${TOOL}-${VERSION}_post-install.sh 
    ./${TOOL}-${VERSION}_post-install.sh 
