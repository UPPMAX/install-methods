grenedalf/0.2.0-beta
========================

<https://github.com/lczech/grenedalf>

Used under license:
GPL3
<https://github.com/lczech/grenedalf/blob/master/LICENSE>

Structure creating script (makeroom_grenedalf_0.2.0-beta.sh) moved to /sw/bioinfo/grenedalf/makeroom_0.2.0-beta.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "grenedalf" "-v" "0.2.0-beta" "-c" "bioinfo" "-s" "misc" "-w" "https://github.com/lczech/grenedalf" "-l" "GPL3" "-L" "https://github.com/lczech/grenedalf/blob/master/LICENSE" "-d" "grenedalf is a collection of commands for working with population genetic data, in particular from pool sequencing. Its main focus are statistical analyses such as Tajima's D and Fst, following the approaches of PoPoolation and PoPoolation2"
    ./makeroom_grenedalf_0.2.0-beta.sh
    cd $SRCDIR/0.2.0-beta
    
    module load git/2.34.1 gcc/12.2.0 cmake/3.22.2
    git clone --recursive https://github.com/lczech/grenedalf.git rackham
    cd rackham
    make -j 20
    


