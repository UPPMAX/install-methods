trf/4.09.1
==========

<https://github.com/Benson-Genomics-Lab/TRF>

Used under license:
Gnu Afferoo GPL v3

Structure creating script (makeroom_trf_4.09.1.sh) moved to /sw/bioinfo/trf/makeroom_4.09.1.sh

LOG
---

    TOOL=trf
    VERSION=4.09.1
    cd /sw/bioinfo/$TOOL

    makeroom.sh -f -t $TOOL -v $VERSION -s alignment -w https://github.com/Benson-Genomics-Lab/TRF -l "Gnu Afferoo GPL v3" -d "program to locate and display tandem repeats in DNA sequences" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}
    cd src/
    wget https://github.com/Benson-Genomics-Lab/TRF/releases/download/v4.09.1/trf409.linux64
    file trf409.linux64 
    ldd trf409.linux64 
    cp -av trf409.linux64 $PREFIX/
    cd $PREFIX
    chmod +x trf409.linux64 
    ln -s trf409.linux64 trf
    ./trf --help

