pandoc/2.10.1
========================

<https://pandoc.org/>

Used under license:
GPL 2

Structure creating script (makeroom_pandoc_2.10.1.sh) moved to /sw/apps/pandoc/makeroom_2.10.1.sh

LOG
---

    TOOL=pandoc
    VERSION=2.10.1
    cd /sw/apps/pandoc
    makeroom.sh -t $TOOL -v $VERSION -w https://pandoc.org/ -c apps -l "GPL 2" -d "Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library." -f
    ./makeroom_${TOOL}_${VERSION}0.1.sh 
    source SOURCEME_${TOOL}_${VERSION}0.1 
    cd $VERSION
    cd src
    wget https://github.com/jgm/pandoc/releases/download/${VERSION}0.1/${TOOL}-${VERSION}0.1-linux-amd64.tar.gz
    tar xzf ${TOOL}-${VERSION}0.1-linux-amd64.tar.gz 
    rmdir $PREFIX
    mv ${TOOL}-${VERSION}0.1 $PREFIX

