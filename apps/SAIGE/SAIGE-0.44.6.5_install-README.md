SAIGE/0.44.6.5
==============

<https://github.com/weizhouUMICH/SAIGE>

Used under license:
GPL v3


Structure creating script (makeroom_SAIGE_0.44.6.5.sh) moved to /sw/apps/SAIGE/makeroom_0.44.6.5.sh

LOG
---

    makeroom.sh -f -t "SAIGE" -v "0.44.6.5" -c "apps" -w "https://github.com/weizhouUMICH/SAIGE" -l "GPL v3" -d "An R package with Scalable and Accurate Implementation of Generalized mixed model \\(Chen\\, H. et al. 2016\\). It accounts for sample relatedness and is feasible for genetic association tests in large cohorts and biobanks \\(N \\> 400\\,000\\)."
    ./makeroom_SAIGE_0.44.6.5.sh

    source /sw/apps/SAIGE/SOURCEME_SAIGE_0.44.6.5
    cd $SRCDIR

    module load git/2.28.0
    module load R_packages/4.0.4
    module load python/2.7.15
    module load python3/3.8.7
    module load openblas/0.3.15
    module load cmake/3.17.3
    module load autoconf/2.69 automake/1.14.1 m4/1.4.17

    [[ -d SAIGE ]] && rm -rf SAIGE
    git clone --depth 1 https://github.com/weizhouUMICH/SAIGE
    git reset --hard 57c43dbc6622a154f434fcf696e767b1820f1e7a
    export R_LIBS_USER=$PREFIX

    mkdir -p external_tarballs
    cd external_tarballs
    [[ -f MetaSKAT_0.81.tar.gz ]] || wget https://cran.r-project.org/src/contrib/Archive/MetaSKAT/MetaSKAT_0.81.tar.gz
    R CMD INSTALL MetaSKAT_0.81.tar.gz 
    cd ..

    vi SAIGE/src/Makevars

Now add /sw/libs/openblas/0.3.15/$CLUSTER/lib/libopenblas.a as the last item in the OBJECTS line
Then, install SAIGE straightaway.

    R CMD INSTALL SAIGE

Do separately for rackham, and snowy/irma/bianca (because of openblas)

