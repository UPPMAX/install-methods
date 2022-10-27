subread/2.0.3
========================

<http://>

Used under license:



Structure creating script (makeroom_subread_2.0.3.sh) moved to /sw/bioinfo/subread/makeroom_2.0.3.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "subread" "-v" "2.0.3" "-f"
    ./makeroom_subread_2.0.3.sh

    TOOL=subread
    VERSION=2.0.3

# Download and extract
    cd $SRCDIR
    wget https://sourceforge.net/projects/subread/files/${TOOL}-${VERSION}/${TOOL}-${VERSION}-source.tar.gz
    tar xfvz  subread-2.0.3-source.tar.gz --strip-components 1 -C $PREFIX
    
# Make
    cd #PREFIX/src
    module load gcc/8.3.0
    make -j 20 -f Makefile.Linux 

# Test
    # Modify test_all.sh to use #!/bin/bash
    cd $PREFIX/test
    sed -i '1s/.*/\#\!\/bin\/bash/' test_all.sh
    ./test_all.sh





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
