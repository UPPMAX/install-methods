hapROH/9bcbc25
========================

<https://pypi.org/project/hapROH/>

Used under license:
GPLv3
<https://github.com/hringbauer/hapROH/commit/acf5b04e479aae1eb4d30fbb79d45be6cb052995>

Structure creating script (makeroom_hapROH_9bcbc25.sh) moved to /sw/bioinfo/hapROH/makeroom_9bcbc25.sh

LOG
---

    TOOL=hapROH
    VERSION=9bcbc25
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/hapROH/9bcbc25/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "hapROH" -v "9bcbc25" -d "Software to call ROH from ancient and present-day DNA using reference haplotypes." -s "misc" -l "GPLv3" -L "https://github.com/hringbauer/hapROH/commit/acf5b04e479aae1eb4d30fbb79d45be6cb052995" -w "https://pypi.org/project/hapROH/"
    ./makeroom_hapROH_9bcbc25.sh
    ml python/3.7.2
    pip install hapROH --target=$PREFIX
