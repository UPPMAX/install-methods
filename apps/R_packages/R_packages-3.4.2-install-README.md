R_packages/3.4.2
================

Module holding installations of some commonly-used R packages.  Not
comprehensive with respect to CRAN, but should be useful for some.

Addendum 2017-11-21: use `dependencies=TRUE` to install `Suggests` dependencies
along with the other strict ones.

LOG
---

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

    VERSION=3.4.2
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
    module load R/$VERSION
    module load build-tools
    module load autoconf/2.69
    module load automake/1.14.1
    module load m4/1.4.17

The build tools modules are required for some more recent configure scripts
within R packages.

Loading R loads a bunch of stuff including gcc that will be used for building
R packages.  So, like with perl_modules, R_packages is associated with a
specific R module version.  Make sure you are using R/3.4.2:

    which R

Set the cluster directory contents to be writable for the owner only, if
installing new packages.  This will be undone later.

    chmod -R u+rwX .

and run R:

    R


Within R
--------

Now, within R, install this packages from CRAN, ensuring that it was installed
within this R_packages tree:

    install.packages('getopt', dependencies=TRUE)

In another shell outside R (substituting `VERSION` and `CLUSTER`):

    ls -l /sw/apps/R_packages/$VERSION/$CLUSTER

After checking that was installed within the appropriate R_packages tree,
continue with these, including some from BioConductor.


    install.packages(c('Rcpp','ggplot2','tidyr','hexbin','lmerTest','microbenchmark','xtable','testthat','DBI','VennDiagram','ade4','adegenet','vegan','ape','assertthat','akima','bitops','boot','caTools','chron','combinat','data.table','reshape2','kernlab','foreach','geiger','dplyr','picante','plyr','pvclust','rmarkdown','permute','markdown','plotrix','openssl','curl','seqinr','stringr','survival','vegan','whisker','zoo','maps','mvtnorm','dendextend','cluster','naturalsort','gplots','tkrplot','tmod','Lahman','RJSONIO','ecodist','gee','hflights','igraph','optparse','proto','reshape','mixOmics','vcfR','EMT','forecast','devtools','withr','rlang','car','gclus'),dependencies=TRUE)
    install.packages('rstan', dependencies=TRUE)

The `'rstan'` installation will fail while attempting to install `rstan`
itself, though it will be able to install several dependencies.  Rstan 2.16.2
is incompatible with the latest version of `boost` provided in the `BH`
package.  `rstan` will eventually get fixed.

    source('https://bioconductor.org/biocLite.R')
    biocLite()
    biocLite(c('ggtree','Rhtslib','zlibbioc','edgeR','DEXSeq','goseq','GO.db','reactome.db','Gviz','org.Mm.eg.db','sva','dada2','DESeq','DESeq2','limma','AnnotationDbi','impute','preprocessCore','MODA','ROC','TCC','baySeq','multtest','phyloseq','DiffBind','ChIPpeakAnno','csaw','tximport','Glimma','MultiAssayExperiment','scater','scran','ChIPQC','chipseq','htSeqTools','ChIPQC','chipseq','htSeqTools'), dependencies=TRUE)

Packages not added yet:



See the README for 3.3.0 if you get the messages about instruction problems or
too-new or too-old BioConductor packages when using `biocLite`.

Interim updates
---------------

If updating an R package from CRAN, simply use `install.packages(...)` within R.

If updating BioConductor to an already-existing module, just do the `source...()` and then launch right into using `biocLite(...)`.

    source('https://bioconductor.org/biocLite.R')
    biocLite(c(...), dependencies=TRUE)

Updating existing packages in this module
-----------------------------------------

Note that after installing some packages, the existence of additional updates
might be announced.  It is OK to accept these updates; updates to the base R
packages has write permissions are locked down on the R module itself so those
can't be updated.  Be sure to update the list of installed packages.

Do not update base R packages.  See the following section if you get the
message about updating base backages such as Matrix, mgcv, nlme, and survival.

Quit R, save the environment.


Do not update base R packages
-----------------------------

After installations of BioConductor or other packages, R might suggest you
update some base packages.  Always choose 'n' to update NONE of the base
packages.  Unless there is a serious bug, we will only update base packages
along with updating R.


External packages
-----------------

Install a non-CRAN package ASCAT.
  
    mkdir -p /sw/apps/R_packages/$VERSION/external_packages
    cd /sw/apps/R_packages/$VERSION/external_packages

Download the latest release here (https://github.com/Crick-CancerGenomics/ascat/releases).

    ASCAT_VERSION=2.5
    [[ -f ASCAT_${ASCAT_VERSION}.tar.gz ]] || wget https://github.com/Crick-CancerGenomics/ascat/releases/download/v2.5/ASCAT_${ASCAT_VERSION}.tar.gz
    R CMD INSTALL ASCAT_${ASCAT_VERSION}.tar.gz

Also, install an outdated package `igraph0`, which has been superseded by
`igraph` (installed above) but needed by some older procedures.

    IGRAPH0_VERSION=0.5.7
    [[ -f igraph0_${IGRAPH0_VERSION}.tar.gz ]] || wget https://cran.r-project.org/src/contrib/Archive/igraph0/igraph0_${IGRAPH0_VERSION}.tar.gz
    R CMD INSTALL igraph0_${IGRAPH0_VERSION}.tar.gz


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

Repeat for rackham.  Don't forget to write-protect!


Note about the mf file
----------------------

Though this build procedure sets `R_LIBS_USER` to ease installing R packages,
the mf file for the module sets `R_LIBS_SITE`, not `R_LIBS_USER`.  This is so
users can freely use `R_LIBS_USER` to refer to their own or project-specific R
package trees without fearing conflicting with this module.

