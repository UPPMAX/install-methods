GenomeThreader/1.7.1
========================

<http://genomethreader.org/>

Used under license:
Custom AS IS

Structure creating script (makeroom_GenomeThreader_1.7.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/GenomeThreader/makeroom_1.7.1.sh


Can't install version 1.7.3 as it requires libc 2.27, so installed this version instead as per developer advice (<https://github.com/genometools/genomethreader/issues/1>).


LOG
---

    TOOL=GenomeThreader
    VERSION=1.7.1
    makeroom.sh -f" -s "annotation" -t "${TOOL}" -v "${VERSION}" -w "http://genomethreader.org/" -l "Custom AS IS" -d "software tool to compute gene structure predictions"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/$TOOL

    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/src/
    wget http://genomethreader.org/distributions/gth-${VERSION}-Linux_x86_64-64bit.tar.gz
    tar xzf gth-${VERSION}-Linux_x86_64-64bit.tar.gz 
    rmdir $PREFIX && mv gth-${VERSION}-Linux_x86_64-64bit $PREFIX
    cd $PREFIX

