phyx/1.3
========================

<https://github.com/FePhyFoFum/phyx>

Used under license:
GPL-3.0
<https://github.com/FePhyFoFum/phyx/blob/master/LICENSE>

Structure creating script (makeroom_phyx_1.3.sh) moved to /sw/bioinfo/phyx/makeroom_1.3.sh

LOG
---

    makeroom.sh "-t" "phyx" "-v" "1.3" "-c" "bioinfo" "-w" "https://github.com/FePhyFoFum/phyx" "-l" "GPL-3.0" "-L" "https://github.com/FePhyFoFum/phyx/blob/master/LICENSE" "-d" "phyx performs phylogenetics analyses on trees and sequences" "-s" "phylogeny"
    ./makeroom_phyx_1.3.sh
    
    cd $PREFIX
    TOOLBINS=$(singularity exec phyx.sif ls -1 /usr/local/bin/)
    mkdir -p bin && cd bin
    for i in $TOOLBINS; do ln -s ../phyx.sif $i; done

