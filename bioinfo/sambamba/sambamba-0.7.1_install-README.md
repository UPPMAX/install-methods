sambamba/0.7.1
========================

<http://lomereiter.github.io/sambamba>

Used under license:
GPL v2+

Structure creating script (makeroom_sambamba_0.7.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/sambamba/makeroom_0.7.1.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "sambamba" -v "0.7.1" -f" -w "http://lomereiter.github.io/sambamba" -s "misc" -l "GPL v2+" -d "http://lomereiter.github.io/sambamba"


LOG
---

Download precompiled linux 64-bit, and add versionless symlink.  We don't
compile this ourselves, because it is written in the D language.

    TOOL=sambamba
    VERSION=${VERSION}
    cd /sw/bioinfo
    makeroom.sh -t $TOOL -v $VERSION -f -w http://lomereiter.github.io/sambamba -s misc -l "GPL v2+" -d "http://lomereiter.github.io/sambamba"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/biod/sambamba/releases/download/v${VERSION}/sambamba-${VERSION}-linux-static.gz
    gunzip sambamba-${VERSION}-linux-static.gz 
    mv sambamba-${VERSION}-linux-static $PREFIX
    cd $PREFIX
    chmod +x sambamba-${VERSION}-linux-static
    ln -s sambamba-${VERSION}-linux-static sambamba

