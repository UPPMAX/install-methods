cd-hit/4.8.1
========================

<https://github.com/weizhongli/cdhit>

Used under license:


Structure creating script (makeroom_cd-hit_4.8.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/cd-hit/makeroom_4.8.1.sh


LOG
---

    TOOL=cd-hit
    VERSION=4.8.1

    cd /sw/bioinfo
    cd ${TOOL}/
    makeroom.sh -f -t ${TOOL} -s misc -v ${VERSION} -w https://github.com/weizhongli/cdhit -d "Clustering and deduplication of a wide variety of sequence data" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 

    cd ${VERSION}/
    cd src
    wget https://github.com/weizhongli/cdhit/releases/download/V${VERSION}/${TOOL}-v${VERSION}-2019-0228.tar.gz
    tar xzf ${TOOL}-v${VERSION}-2019-0228.tar.gz 
    cd ${TOOL}-v${VERSION}-2019-0228/
    module load zlib/1.2.11
    module load gcc/8.3.0
    make
    cd cd-hit-auxtools/
    make
    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    ml -gcc -zlib
    ldd cd-hit*
    cd psi-cd-hit/
    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    cd ..
    PREFIX=$PREFIX make install
    cd cd-hit-auxtools/
    cp -i cd-hit-dup cd-hit-dup-PE-out.pl cd-hit-lap read-linker $PREFIX/
    cd ..

    cp -av psi-cd-hit $PREFIX/

    cd ..
