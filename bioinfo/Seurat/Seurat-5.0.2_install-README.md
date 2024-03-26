Seurat/5.0.2
=============

<https://cran.r-project.org/web/packages/Seurat/index.html>

Used under license:
MIT


Structure creating script (makeroom_Seurat_5.0.2.sh) moved to /sw/bioinfo/Seurat/makeroom_5.0.2.sh

LOG
---

    makeroom.sh -t Seurat -v 5.0.2   -w "https://cran.r-project.org/web/packages/Seurat/index.html"  -c "bioinfo" -s "pipelines" -l "MIT" -d  "A toolkit for quality control, analysis, and exploration of single cell RNA sequencing data. This module provides Seurat v5"
    ./makeroom_Seurat_5.0.2.sh 
    source /sw/bioinfo/Seurat/SOURCEME_Seurat_5.0.2
    cd $SRCDIR
    ml R_packages/4.3.1
    export R_LIBS_USER=$PREFIX/4.3
    mkdir -p $R_LIBS_USER
    which R
R

And then within R:

    BiocManager::install('Seurat', update=FALSE)
    install.packages('Signac')
    setRepositories(ind = 1:3, addURLs = c('https://satijalab.r-universe.dev', 'https://bnprks.r-universe.dev/'))
    install.packages(c("BPCells", "presto", "glmGamPoi"))
    remotes::install_github("satijalab/seurat-wrappers", upgrade=FALSE)
    remotes::install_github("satijalab/seurat-data", upgrade=FALSE)
    remotes::install_github("satijalab/azimuth", upgrade=FALSE)
    remotes::install_github("mojaveazure/seurat-disk", upgrade=FALSE)

And to capture the versions installed, exit R (save the environment!) and do

    unset R_LIBS_SITE
    R

Then within R

    ip <- as.data.frame(installed.packages()[, c(1, 3:4)])
    rownames(ip) <- NULL
    ip <- ip[is.na(ip$Priority), 1:2, drop=FALSE]
    print(ip[order(tolower(ip$Package)),], row.names=FALSE)

Add this list to the mf file for this module, and load R_packages/4.3.1 as a dependency.
