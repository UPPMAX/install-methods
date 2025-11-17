SAIGE/1.4.1
========================

<https://github.com/saigegit/SAIGE>

Used under license:
GPL v3


Structure creating script (makeroom_SAIGE_1.4.1.sh) moved to /sw/apps/SAIGE/makeroom_1.4.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "SAIGE" "-v" "1.4.1" "-c" "apps" "-w" "https://github.com/saigegit/SAIGE" "-l" "GPL v3" "-d" "SAIGE is an R package developed with Rcpp for genome-wide association tests in large-scale data sets and biobanks.  \(N \> 400\,000\)."
    ./makeroom_SAIGE_1.4.1.sh

    source /sw/apps/SAIGE/SOURCEME_SAIGE_1.4.1 && cd $SRCDIR

    module load git/2.44
    module load R_packages/4.3.§
#    module load python/2.7.15
#    module load python3/3.8.7
    module load openblas/0.3.29
    module load cmake/3.26.3
    module load autoconf/2.69 automake/1.16.1 m4/1.4.17

    
    [[ -d SAIGE ]] && rm -rf SAIGE
    src_branch=main
    repo_src_url=https://github.com/saigegit/SAIGE
    git clone -b $src_branch $repo_src_url
    cd SAIGE
    git reset --hard 1d8ab8d  #get version 1.4.1

    export R_LIBS_USER=$PREFIX
    cd ..
    Rscript ./SAIGE/extdata/install_packages.R
    R CMD INSTALL SAIGE


