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

and replace the table in the webpage
<http://www.uppmax.uu.se/support/user-guides/r_packages-module-guide/>.

I am leaving the `.RData` and `.Rhistory` in place for both the milou and
tintin installs, immediately under `$modroot` which is
`R_packages/3.3.0/$CLUSTER`.

