Trycycler/0.5.4
========================

<https://github.com/rrwick/Trycycler>

Used under license:
GPL-3.0
<https://github.com/rrwick/Trycycler/blob/main/LICENSE>

Structure creating script (makeroom_Trycycler_0.5.4.sh) moved to /sw/bioinfo/Trycycler/makeroom_0.5.4.sh

LOG
---

    makeroom.sh "-t" "Trycycler" "-v" "0.5.4" "-c" "bioinfo" "-l" "GPL-3.0" "-w" "https://github.com/rrwick/Trycycler" "-L" "https://github.com/rrwick/Trycycler/blob/main/LICENSE" "-d" "Trycycler is a tool for generating consensus long-read assemblies for bacterial genomes." "-s" "assembly"
    ./makeroom_Trycycler_0.5.4.sh
    cd $SRCDIR
    module load conda
    export CONDA_ENVS_PATH=$PREFIX
    conda create -c bioconda -c conda-forge -n trycycler trycycler --override-channels
     
