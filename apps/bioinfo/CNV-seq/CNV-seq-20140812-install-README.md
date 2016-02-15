# CNV-seq-20140812-install-README.md

TITLE
=====

CNV-seq 201400812


DESCRIPTION
-----------

Xie C and MT Tammi.  2009.  CNV-seq, a new method to detect copy number variation using high-throughput sequencing.  *BMC Bioinformatics* **10**:80.

<http://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-80>

<http://tiger.dbs.nus.edu.sg/cnv-seq/>


Log
---

It provides its own R package `cnv`, which requires `ggplot2`, which requires a
lot of stuff.  There was a large rewrite of ggplot2 between v1 and the
recently-released v2, and I doubt this package can handle v2 or rather, I
wonder whether users would be con=fused by deprecated warnings etc. when using
ggplot2 v2, so instead I installed the most recent previous version, ggplot2
1.0.1.

    cd /sw/apps/bioinfo/
    mkdir -p CNV-seq
    mkdir -p 20140812
    cd 20140812
    mkdir src milou

    cd milou/
    mkdir R_packages
    cd R_packages/
    export R_LIBS_USER=$PWD
    echo $R_LIBS_USER 
    cd ../../src
    wget http://tiger.dbs.nus.edu.sg/cnv-seq/cnv-seq.tar.gz
    tar xzf cnv-seq.tar.gz

Now R packages. Remember, ggplot2 1.0.1.

    module load R/3.2.3

This also loads `gcc/4.9.2` and `java/sun_jdk1.8.0_40` which will be used for
package installs.

    wget https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_1.0.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 

That did not work, lots of other prereqs.  Find out what they are.

    tar xzf ggplot2_1.0.1.tar.gz 
    cd ggplot2/
    cat DESCRIPTION

And we look for Imports:

    Imports: plyr (>= 1.7.1), digest, grid, gtable (>= 0.1.1), reshape2,
            scales (>= 0.2.3), proto, MASS

MASS and grid are standard packages but the others, no.

    cd ..
    rm -rf ggplot2

Download packages and figure out through trial and error what other packages we need.

    wget https://cran.r-project.org/src/contrib/Rcpp_0.12.3.tar.gz
    wget https://cran.r-project.org/src/contrib/gtable_0.1.2.tar.gz
    wget https://cran.r-project.org/src/contrib/plyr_1.8.3.tar.gz
    wget https://cran.r-project.org/src/contrib/digest_0.6.9.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ Rcpp_0.12.3.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ gtable_0.1.2.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ plyr_1.8.3.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ digest_0.6.9.tar.gz 

    wget https://cran.r-project.org/src/contrib/scales_0.3.0.tar.gz
    wget https://cran.r-project.org/src/contrib/RColorBrewer_1.1-2.tar.gz
    wget https://cran.r-project.org/src/contrib/dichromat_2.0-0.tar.gz
    wget https://cran.r-project.org/src/contrib/colorspace_1.2-6.tar.gz
    wget https://cran.r-project.org/src/contrib/munsell_0.4.2.tar.gz
    wget https://cran.r-project.org/src/contrib/labeling_0.3.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ RColorBrewer_1.1-2.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ dichromat_2.0-0.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ colorspace_1.2-6.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ munsell_0.4.2.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ labeling_0.3.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ scales_0.3.0.tar.gz 

    wget https://cran.r-project.org/src/contrib/stringi_1.0-1.tar.gz
    wget https://cran.r-project.org/src/contrib/magrittr_1.5.tar.gz
    wget https://cran.r-project.org/src/contrib/stringr_1.0.0.tar.gz
    wget https://cran.r-project.org/src/contrib/reshape2_1.4.1.tar.g
    wget https://cran.r-project.org/src/contrib/proto_0.3-10.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ stringi_1.0-1.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ magrittr_1.5.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ stringr_1.0.0.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ reshape2_1.4.1.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ proto_0.3-10.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 

Finally install the `cnv` package.

    cd cnv-seq/
    R CMD INSTALL -l $R_LIBS_USER/ cnv/

Now change all perl scripts to have `#!/usr/bin/env perl`, though the perl
version is not important as they should work with the system 5.10.1.

    vi *.pl
    cp -p *.pl ../../milou

Now make sure `R_LIBS_USER` is set in the mf file, and add $modroot to PATH to
find the perl scripts.  I probably do not need to load blat, users should be
able to figure that out.

Tested on tintin using the test data procedure described in 
<http://tiger.dbs.nus.edu.sg/cnv-seq/doc/manual.pdf> and it worked just fine.

