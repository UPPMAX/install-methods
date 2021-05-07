mash/2.3
========================

<https://github.com/marbl/Mash>

Used under license:
CopyRight
<>

Structure creating script (makeroom_mash_2.3.sh) moved to /sw/bioinfo/mash/makeroom_2.3.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "mash" -v "2.3" -w "https://github.com/marbl/Mash" -l "CopyRight" -f
    ./makeroom_mash_2.3.sh
    TOOL=mash
    version=2.3
    source /sw/bioinfo/$TOOL/SOURCEME_${TOOL}_${version}
    cd $SRCDIR
    wget https://github.com/marbl/Mash/releases/download/v2.3/mash-Linux64-v2.3.tar
    tar xfv mash-Linux64-v2.3.tar --strip=1
    cp mash $PREFIX

