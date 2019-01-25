Roary/3.12.0
===========

Pan-genome pipeline

<https://sanger-pathogens.github.io/Roary/>


LOG
---

    VERSION=3.12.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/Roary/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER 
    mkdir -p src
    cd src

    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/sanger-pathogens/Roary/archive/v${VERSION}.tar.gz
    [[ -d Roary-${VERSION} ]] && rm -rf	Roary-${VERSION}	
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

LOG lars
___

*Don't* use install_dependecies.sh script. check if dependencies are in the module tree and load them accordingly

mspid cd-Hit
mspid bedtools
mspid Prank
mspid fasttree
mspid mafft

ml Bioinfo-tools
ml cd-hit/4.6.8-2017-1208 
ml BEDTools/2.27.1
ml FastTree/2.1.10
ml MAFFT/7.310
ml prank/170427
ml Kraken/1.1-352e780

The mf currently loads the folowoing modules:
1) uppmax                4) BioPerl/1.7.1_Perl5.24.1   7) gnuparallel/20170122  10) cd-hit/4.6.8-2017-1208  13) prank/170427      16) Kraken/1.1-352e780
  2) bioinfo-tools         5) mcl/14-137                 8) BEDTools/2.27.1       11) blast/2.6.0+            14) jellyfish/1.1.11
  3) perl_modules/5.24.1   6) FastTree/2.1.10            9) MAFFT/7.310           12) Roary/3.12.0            15) perl/5.24.1
