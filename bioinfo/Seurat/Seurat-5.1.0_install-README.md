Seurat/5.1.0
========================

<https://cran.r-project.org/web/packages/Seurat/index.html>

Used under license:
MIT


Structure creating script (makeroom_Seurat_5.1.0.sh) moved to /sw/bioinfo/Seurat/makeroom_5.1.0.sh

LOG
---

    makeroom.sh "-t" "Seurat" "-v" "5.1.0" "-w" "https://cran.r-project.org/web/packages/Seurat/index.html" "-c" "bioinfo" "-s" "pipelines" "-l" "MIT" "-d" "A toolkit for quality control, analysis, and exploration of single cell RNA sequencing data. This module provides Seurat v5" "-f"
    ./makeroom_Seurat_5.1.0.sh
    
    source /sw/bioinfo/Seurat/SOURCEME_Seurat_5.1.0
    cd $SRCDIR
    ml R_packages/4.3.1
    export R_LIBS_USER=$PREFIX/4.3
    mkdir -p $R_LIBS_USER
    which R

BPCells needs some special treatment
    wget https://github.com/bnprks/BPCells/archive/refs/tags/v0.2.0.tar.gz
    tar xzvf v0.2.0.tar.gz
    cp -r BPCells-0.2.0 BPCells-0.2.0_fix
    vim BPCells-0.2.0_fix/r/configure
  change line 34-35
        HDF5_CFLAGS="${HDF5_CFLAGS-}"
        HDF5_LIBS="${HDF5_LIBS--lhdf5}"
    cd BPCells-0.2.0_fix
    MAKEFLAGS=j8 HDF5_CFLAGS="-I${HDF5_INCLUDE}" HDF5_LIBS="-L${HDF5_LIB} -lhdf5" R CMD INSTALL r
  test
    module unload hdf5/1.14.0
    ldd $R_LIBS_USER/BPCells/libs/BPCells.so
R

And then within R: TESTING STILL
 - one needs first?
   - Matrix 1.6.4
    remotes::install_version(package = 'Matrix', version = package_version('1.6.4'))
   - SeuratObject 5.0.2
    remotes::install_version(package = 'SeuratObject', version = package_version('5.0.2'))
    BiocManager::install('Seurat', update=FALSE)
Other
    install.packages('Signac')
    setRepositories(ind = 1:3, addURLs = c('https://satijalab.r-universe.dev', 'https://bnprks.r-universe.dev/'))
    install.packages(c("presto", "glmGamPoi"))
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
