# Roary-3.6.2-install-README.md

Roary/3.6.2
===========

Pan-genome pipeline

<https://sanger-pathogens.github.io/Roary/>


LOG
---

    VERSION=3.6.2
    CLUSTER=milou
    cd /sw/apps/bioinfo/Roary/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER 
    mkdir -p src
    cd src
    wget https://github.com/sanger-pathogens/Roary/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd Roary-${VERSION}

Check dependencies.  I think we have most/all of them from `Roary/3.5.5`.

    view install_dependencies.sh 

Installed the latest versions of Perl modules  into the `perl_modules/5.18.4` module.

Turns out we've got an older GNU parallel, which worked fine apparently for 3.5.5 but I would rather update.... so back after adding `gnuparallel/20150522`.

Also, there was a strange addition of a bedtools internal directory to `PERL5LIB`, which isn't in the standard bedtools config.  In a temp directory, I installed Roary 3.6.2 and ran its `install_dependencies.sh` script to see if I could track it down, or any other strange requirements.  Turns out it was nothing, it referred to a nonexistent directory in its own copy of bedtools too.

Now copy Roary directories over to the cluster and disable potentially interfering things.

    cp -a * ../../$CLUSTER/
    cd ../../$CLUSTER/
    mv binaries _binaries
    chmod -x install_dependencies.sh 

Install the R package `ggplot2`, and add dependency on `R/3.3.0`.

    module load R/3.3.0
    mkdir R_packages
    export R_LIBS_USER=$PWD/R_packages
    export R_LIBS=$PWD/R_packages
    R

Within R, did `install.packages('ggplot2')`.  This was much faster than all the by-hand stuff I've done in the past, I think I'll do it this way from now on.

Get mf from 3.5.5, update the gnuparallel version and add load of `R/3.3.0`.

