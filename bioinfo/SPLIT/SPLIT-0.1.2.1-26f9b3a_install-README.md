SPLIT/0.1.2.1-26f9b3a
========================

<https://github.com/bdsc-tds/SPLIT>

Used under license:
GPL-3.0


Structure creating script (makeroom_SPLIT_0.1.2.1-26f9b3a.sh) moved to /sw/bioinfo/SPLIT/makeroom_0.1.2.1-26f9b3a.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "SPLIT" "-v" "0.1.2.1-26f9b3a" "-d" "Profile purification of single-cell spatial transcriptomics data" "-l" "GPL-3.0" "-w" "https://github.com/bdsc-tds/SPLIT" "-s" "annotation"
    ./makeroom_SPLIT_0.1.2.1-26f9b3a.sh

    # load modules
    module load bioinfo-tools
    module load R_packages

    # install 
    mkdir $PREFIX/R_libs
    Rscript --vanilla -e "remotes::install_github('dmcable/spacexr@698d5b0', upgrade = 'never', lib = '$PREFIX/R_lib')"
    Rscript --vanilla -e "remotes::install_github('bdsc-tds/SPLIT@26f9b3a',  upgrade = 'never', lib = '$PREFIX/R_lib')"

    # Check if you can load SPLIT
    Rscript --vanilla -e "library('SPLIT', lib.loc='$PREFIX/R_lib')"
