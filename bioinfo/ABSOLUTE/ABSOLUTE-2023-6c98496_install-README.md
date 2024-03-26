ABSOLUTE/2023-6c98496
========================

<https://github.com/getzlab/ABSOLUTE>

Used under license:
BSD 3


Structure creating script (makeroom_ABSOLUTE_2023-6c98496.sh) moved to /sw/bioinfo/ABSOLUTE/makeroom_2023-6c98496.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "ABSOLUTE" "-v" "2023-6c98496" "-w" "https://github.com/getzlab/ABSOLUTE" "-l" "BSD 3" "-d" "Extracts absolute copy numbers per cancer cell from a mixed DNA population. Use this module for the per-sample processing step in the workflow (usually after HAPSEG). Works with allelic copy ratio on both hg19 and hg38 " "-s" "misc"
    ./makeroom_ABSOLUTE_2023-6c98496.sh
    source /sw/bioinfo/ABSOLUTE/SOURCEME_ABSOLUTE_2023-6c98496 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/getzlab/ABSOLUTE.git
    mv -a ABSOLUTE/* .
    mv .git* ../
    rmdir ABSOLUTE/i
    rm deploy.sh Dockerfile
main executable is v1.5/absolute.R. Change header: #!/bin/env Rscript
test 
    ml R/4.2.1 python/3.9.5 
    v1.5/absolute.R
Make both v1.5 and src dirs to PATH in mf file

