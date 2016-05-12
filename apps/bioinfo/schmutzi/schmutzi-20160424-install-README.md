# schmutzi-20160424-install-README.md

TITLE
=====

schmutzi 20160424


DESCRIPTION
-----------

<https://github.com/grenaud/schmutzi>


Log
---

It lists a few requirements, and fails to list several others: Perl's
`File::Which`, R's `ggplot2` and `gplots`, and all of their prerequisites.  As
I wrote for CNV-seq, there was a large rewrite of ggplot2 between v1 and the
recently-released v2, and I doubt this package can handle v2 or rather, I
wonder whether users would be confused by deprecated warnings etc. when using
ggplot2 v2, so instead I installed the most recent previous version, ggplot2
1.0.1.

I install it on top of R/3.2.3 and perl/5.18.4.


    cd /sw/apps/bioinfo/
    mkdir -p schmutzi
    mkdir -p 20150424
    cd 20140812
    mkdir src milou

    cd milou/
    mkdir R_packages
    cd R_packages/
    export R_LIBS_USER=$PWD
    echo $R_LIBS_USER 
    cd ../../src

    git clone --recursive https://github.com/grenaud/schmutzi.git
    cd schmutzi

Prepare the build environment, which it inherits from R/3.2.3.

    module load R/3.2.3
    module load perl/5.18.4
    module load perl_modules/5.18.4

See what R packages are needed, apart from what it says.

    vi *.R

Install.

    wget https://cran.r-project.org/src/contrib/digest_0.6.9.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ digest_0.6.9.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_0.12.3.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ Rcpp_0.12.3.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/gtable/gtable_0.1.2.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.8.3.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ plyr_1.8.3.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ gtable_0.1.2.tar.gz

Get ggplot2 1.0.1 from CNV-seq, simpler.

    cp ../../../CNV-seq/20140812/src/ggplot2_1.0.1.tar.gz .
    R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 

    wget https://cran.r-project.org/src/contrib/scales_0.3.0.tar.gz
    wget https://cran.r-project.org/src/contrib/RColorBrewer_1.1-2.tar.gz
    wget https://cran.r-project.org/src/contrib/dichromat_2.0-0.tar.gz
    wget https://cran.r-project.org/src/contrib/colorspace_1.2-6.tar.gz
    wget https://cran.r-project.org/src/contrib/labeling_0.3.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/munsell/munsell_0.4.2.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ RColorBrewer_1.1-2.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ dichromat_2.0-0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ colorspace_1.2-6.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ munsell_0.4.2.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ labeling_0.3.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/scales/scales_0.3.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ scales_0.3.0.tar.gz
    wget https://cran.r-project.org/src/contrib/stringi_1.0-1.tar.gz
    wget https://cran.r-project.org/src/contrib/magrittr_1.5.tar.gz
    wget https://cran.r-project.org/src/contrib/stringr_1.0.0.tar.gz
    wget https://cran.r-project.org/src/contrib/reshape2_1.4.1.tar.g
    wget https://cran.r-project.org/src/contrib/proto_0.3-10.tar.gz
    wget https://cran.r-project.org/src/contrib/reshape2_1.4.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ stringi_1.0-1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ magrittr_1.5.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ stringr_1.0.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ reshape2_1.4.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ proto_0.3-10.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 

    wget https://cran.r-project.org/src/contrib/bitops_1.0-6.tar.gz
    wget https://cran.r-project.org/src/contrib/rpart_4.1-10.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ bitops_1.0-6.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ rpart_4.1-10.tar.gz 
    wget https://cran.r-project.org/src/contrib/caTools_1.17.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ caTools_1.17.1.tar.gz 
    wget https://cran.r-project.org/src/contrib/KernSmooth_2.23-15.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ KernSmooth_2.23-15.tar.gz 
    wget https://cran.r-project.org/src/contrib/gtools_3.5.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ gtools_3.5.0.tar.gz 
    wget https://cran.r-project.org/src/contrib/gdata_2.17.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ gdata_2.17.0.tar.gz 
    wget https://cran.r-project.org/src/contrib/gplots_3.0.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ gplots_3.0.1.tar.gz 

Now look for Perl prereqs.  The Only one that looks nonstandard is `File::Which`, which we have in `perl_modules/5.18.4` and I have now updated.

    vi *.pl
    perl -d -e 'use File::Which'
    module load perl/5.18.4
    module load perl_modules/5.18.4
    perl -d -e 'use File::Which'

Also, edit all perl scripts to have '#!/usr/bin/env perl'

    vi *.pl

Now copy scripts and executables over to the cluster directory and remove extraneous files.

    cp $(grep ^all Makefile | cut -f2 -d:) *.R *.pl ../../milou/
    cd ../../milou/
    rm libbamtools.a 
    rm utils.o 

For the mf, we need to load R/3.2.3, perl/5.18.4, perl_modules/5.18.4, and update R_LIBS_USER.

