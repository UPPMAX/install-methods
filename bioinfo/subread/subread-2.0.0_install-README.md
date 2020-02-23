subread/2.0.0
========================

<http://subread.sourceforge.net/>

Used under license:
GPL

Structure creating script (makeroom_subread_2.0.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/subread/makeroom_2.0.0.sh

LOG
---

    TOOL=subtread
    VERSION=2.0.0
    makeroom.sh -f -t $TOOL -v ${VERSION} -s misc -w http://subread.sourceforge.net/ -l GPL -d "high-performance read alignment, quantification and mutation discovery"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION
    cd src
    wget https://downloads.sourceforge.net/project/subread/${TOOL}-${VERSION}/${TOOL}-${VERSION}-source.tar.gz
    mv ${TOOL}-${VERSION}-source.tar.gz
    tar xzf ${TOOL}-${VERSION}-source.tar.gz
    cd ${TOOL}-${VERSION}-source/
    cd src
    module load gcc/8.3.0
    make -f Makefile.Linux 
    cp -av {README.txt,annotation,bin,doc,test} $PREFIX/

Both `$PREFIX/bin` and `$PREFIX/bin/utilities` need to be in `PATH`.
Add a note about `$SUBREAD_ROOT/annotation/` to the module help.
