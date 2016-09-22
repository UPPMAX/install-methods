# R_packages-3.3.0-install-README.md

R_packages/3.3.0
================

Module holding installations of some commonly-used R packages.  Not
comprehensive with respect to CRAN, but should be useful for some.

LOG
---

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

    VERSION=3.3.0
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
    module load R/3.3.0

Loading R loads a bunch of stuff including gcc, that will be used for building
R packages.  So, like with perl_modules, R_packages is intimately associated
with a specific R module version.

Make sure you are using R/3.3.0, and run R:

    which R
    R

Within R
--------

Now, within R, install the included packages, which will also install their prerequisites.

    install.packages(c("getopt", "ggplot2", "tidyr", "hexbin", "lmerTest", "microbenchmark", "xtable", "testthat", "DBI", "VennDiagram", "ade4", "adegenet", "vegan", "ape", "assertthat", "akima", "bitops", "boot", "chron", "combinat", "data.table", "reshape2", "foreach", "geiger", "dplyr", "picante", "plyr", "pvclust", "rmarkdown", "permute", "markdown", "plotrix", "openssl", "curl", "seqinr", "stringr", "survival", "vegan", "whisker", "zoo"))

A few more packages on 2016-06-13:

    install.packages(c('dendextend', 'dendextendRcpp', 'cluster', 'naturalsort'))

A few more packages on 2016-09-19, including several from Bioconductor.

    module load R_packages/3.3.0
    which R
    cd /sw/apps/R_packages/3.3.0
    chmod -R og+w milou
    cd milou

    R

    install.packages(c('gplots'))

    source("https://bioconductor.org/biocLite.R")
    biocLite()

When installing the above, it will ask for some outdated packages 'update all,
some or none (a/s/n)', so pick 'a'.

At the end it might complain about read-only directory which is over in the
R/3.3.0 package tree.  Do not create a personal library, and let it fail.

    Warning in install.packages(update[instlib == l, "Package"], l, contriburl = contriburl,  :
      'lib = "/pica/sw/apps/R/x86_64/3.3.0/tintin/lib64/R/library"' is not writable

It is trying to update some standard packages in the R/3.3.0 package tree, and
I would rather update those in R_packages/3.3.0 instead. You might also see
something like the following when installing packages.  Don't let it update.
Install them by hand so they go into R_packages/3.3.0 instead.

    Old packages: 'Matrix', 'foreign', 'lattice', 'mgcv', 'survival'
    Update all/some/none? [a/s/n]: n

The thinking is that we should update packages in R_packages/3.3.0, but not in
R/3.3.0.  Installing singly keeps them in R_packages/3.3.0, it seems.  I'm not
sure that this is a persistent solution, though, because the `biocLite()` call
later asks to install them again.

    install.packages('Matrix')
    install.packages('foreign')
    install.packages('lattice')
    install.packages('mgcv')
    install.packages('survival')

Then I installed these packages, for RNA-seq analysis.

    biocLite(c('edgeR','DEXSeq','goseq','GO.db','reactome.db','Gviz','org.Mm.eg.db'))
    q()

Choose to save the environment.

    cd ..
    chmod -R og-w milou


This list will continue to expand with time.

Repeat for tintin.

Produce a list of installed packages and versions, process into html with a
little filter, and add it to the webpage.  Thanks to
http://heuristicandrew.blogspot.se/2015/06/list-of-user-installed-r-packages-and.html
for the tip!

    ip <- as.data.frame(installed.packages()[, c(1, 3:4)])
    rownames(ip) <- NULL
    ip <- ip[is.na(ip$Priority), 1:2, drop=FALSE]
    print(ip, row.names=FALSE)

Paste the table into table.txt and then do

    ./create_html_table.pl table.txt > table.html

and replace the table in the webpage source for
<http://www.uppmax.uu.se/support/user-guides/r_packages-module-guide/>.

I am leaving the `.RData` and `.Rhistory` in place for both the milou and
tintin installs, immediately under `$modroot` which is
`R_packages/3.3.0/$CLUSTER`.

