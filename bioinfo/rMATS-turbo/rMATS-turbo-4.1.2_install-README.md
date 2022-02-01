rMATS-turbo/4.1.2
=================

<https://github.com/Xinglab/rmats-turbo>

Used under license:
FreeBSD
<https://github.com/Xinglab/rmats-turbo/blob/master/LICENSE>

Structure creating script (makeroom_rMATS-turbo_4.1.2.sh) moved to /sw/bioinfo/rMATS-turbo/makeroom_4.1.2.sh

LOG
---

Just grab the docker image to speed this up. It uses python2 which is odd but *I will assume this works*.


    makeroom.sh "-t" "rMATS-turbo" "-v" "4.1.2" "-c" "bioinfo" "-w" "http://rnaseq-mats.sourceforge.net" "-l" "FreeBSD" "-L" "https://github.com/Xinglab/rmats-turbo/blob/master/LICENSE" "-d" "MATS is a computational tool to detect differential alternative splicing events from RNA-Seq data."
    ./makeroom_rMATS-turbo_4.1.2.sh
    source /sw/bioinfo/rMATS-turbo/SOURCEME_rMATS-turbo_4.1.2 && cd $SRCDIR
    singularity pull docker://xinglab/rmats:v4.1.2
    mv rmats_v4.1.2.sif $PREFIX
    cd $PREFIX
    ln -s rmats_v4.1.2.sif rmats.py

Add `$modroot` to PATH.
