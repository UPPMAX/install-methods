BackSPIN/20171211_2fbcf5d
========================

<https://github.com/linnarsson-lab/BackSPIN>

Used under license:
BSD 2-Clause

Structure creating script (makeroom_BackSPIN_20171211_2fbcf5d.sh) moved to /sw/bioinfo/BackSPIN/makeroom_20171211_2fbcf5d.sh

LOG
---

    TOOL=BackSPIN
    VERSION=20171211_2fbcf5d
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/BackSPIN/20171211_2fbcf5d/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "BackSPIN" -v "20171211_2fbcf5d" -s "misc" -w "https://github.com/linnarsson-lab/BackSPIN" -l "BSD 2-Clause" -d "BackSPIN takes input in CEF format and produces an annotated CEF file as output."
    ./makeroom_BackSPIN_20171211_2fbcf5d.sh
    cd $SRCDIR
    git clone https://github.com/linnarsson-lab/BackSPIN
    cd BackSPIN
    ml python/3.7.2
    python setup.py install --prefix $PREFIX
