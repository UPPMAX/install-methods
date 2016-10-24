# R_packages-3.3.1-install-README.md

R_packages/3.3.1
================

Module holding installations of some commonly-used R packages.  Not
comprehensive with respect to CRAN, but should be useful for some.

LOG
---

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

    VERSION=3.3.1
    CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
    cd /sw/apps
    mkdir -p R_packages
    cd R_packages/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER/
    export R_LIBS_USER=$PWD
    module load R/3.3.1

Loading R loads a bunch of stuff including gcc that will be used for building
R packages.  So, like with perl_modules, R_packages is associated with a
specific R module version.  Make sure you are using R/3.3.1:

    which R

Set the cluster directory contents to be writable if installing new packages.

    chmod -R ug+rwX .

 and run R:

    R

Within R
--------

Now, within R, install this packages from CRAN, ensuring that it was installed within this R_packages tree:

    install.packages('getopt')

In another shell outside R (substituting `VERSION` and `CLUSTER`):

    ls -l /sw/apps/R_packages/$VERSION/$CLUSTER

After checking that was installed within the appropriate R_packages tree, continue with these, including some from BioConductor.


    install.packages(c('ggplot2','tidyr','hexbin','lmerTest','microbenchmark','xtable','testthat','DBI','VennDiagram','ade4','adegenet','vegan','ape','assertthat','akima','bitops','boot','caTools','chron','combinat','data.table','reshape2','kernlab','foreach','geiger','dplyr','picante','plyr','pvclust','rmarkdown','permute','markdown','plotrix','openssl','curl','seqinr','stringr','survival','vegan','whisker','zoo','maps','mvtnorm'))
    install.packages(c('dendextend','dendextendRcpp','cluster','naturalsort','gplots','tkrplot'))

    source('https://bioconductor.org/biocLite.R')
    biocLite()
    biocLite(c('ggtree','Rhtslib','zlibbioc','edgeR','DEXSeq','goseq','GO.db','reactome.db','Gviz','org.Mm.eg.db','sva','dada2'))
    biocLite(c('DESeq','DESeq2','limma'))

See the README for 3.3.0 if you get the message about updating base packages
when using `biocLite`.

Also see that README if you get messages about instruction problems or too-new
or too-old BioConductor packages.

Quit R, save the environment.

After adding new packages
-------------------------

Within R, get a list of installed packages and their versions:

    ip <- as.data.frame(installed.packages()[, c(1, 3:4)])
    rownames(ip) <- NULL
    ip <- ip[is.na(ip$Priority), 1:2, drop=FALSE]
    print(ip, row.names=FALSE)

Copy-paste the table into `table.txt` and then create the HTML table from the shell with

    ./create_html_table.pl table.txt > table.html

Add this to the appropriate section of <http://www.uppmax.uu.se/support/user-guides/r_packages-module-guide/>

Set the cluster directory contents to be write-protected.  We do this (like for
perl_modules) so that members of the `sw` group can't inadvertently overwrite
module contents when installing packages for themselves.

    chmod -R -w .

Repeat for tintin, skipping the installed packages table bit.
