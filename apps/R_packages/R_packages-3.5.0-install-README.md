R_packages/3.5.0
================

Module holding installations of CRAN and BioConductor.  An attempt to be
comprehensive.  We can't be completely, because we don't have certain
libraries, Oracle, GPUs, etc. installed, nor did I load specialist modules that
might be connectable.

I'll pick those up by hand afterward.  I want to make sure everything that a
user has requested is definitely installed.

There is a hacky R script `/sw/apps/R_packages/3.5.0/inst.R` that checks for
available packages at CRAN and BioConductor that are uninstalled and installs
from CRAN then BioC, Cran then BioC up to 10 times until the number of
installed packages is the same between two iterations.

    After iteration 3 :

    11932 CRAN packages installed, out of total 12565
    14730 BioConductor packages installed, out of total 15405

The sizes are significantly different to:

    10G   3.4.3/rackham
    201G  3.5.0/rackham

Some of the packages that didn't get picked up are:

    Warning messages:
    1: In install.packages(pkgs = doing, lib = lib, ...) :
    installation of one or more packages failed,
    probably �bgx�, �BiocSklearn�, �ChemmineOB�, �dSimer�, �flipflop�, �rsbml�, �rTANDEM�, �xps�, �bamboo�, �bayesCL�, �bioacoustics�, �biospear�, �BRugs�, �cld3�, �clpAPI�, �cplexAPI�, �cudaBayesreg�, �glpkAPI�, �gpg�, �gpuR�, �h5�, �HierO�, �jqr�, �keyring�, �kmcudaR�, �ldat�, �loon�, �magick�, �mongolite�, �odbc�, �OpenCL�, �pbdMPI�, �pbdPROF�, �pcaL1�, �pdftools�, �permGPU�, �proj4�, �protolite�, �qtbase�, �Rcplex�, �RcppAPT�, �RcppRedis�, �rDEA�, �RDieHarder�, �redland�, �redux�, �rgdal�, �rggobi�, �Rglpk�, �Rhpc�, �rjags�, �rLindo�, �RmecabKo�, �Rmosek�, �rMouse�, �Rmpi�, �RNetCDF�, �RODBC�, �ROracle�, �rpanel�, �Rpoppler�, �RProtoBuf�, �RQuantLib�, �RSAP�, �Rsymphony�, �runjags� [... truncated]
    2: In install.packages(setdiff(cran.pkgs, rownames(installed.packages())),  :
      installation of one or more packages failed,
        probably �bamboo�, �bayesCL�, �bioacoustics�, �biospear�, �BRugs�, �cld3�, �clpAPI�, �cplexAPI�, �cRegulome�, �cudaBayesreg�, �glpkAPI�, �gpg�, �gpuR�, �h5�, �HierO�, �jqr�,keyring�, �kmcudaR�, �ldat�, �loon�, �magick�, �mongolite�, �odbc�, �OpenCL�, �pbdMPI�, �pbdPROF�, �pcaL1�, �pdftools�, �permGPU�, �proj4�, �protolite�, �qtbase�, �Rcplex�, �RcppAPT�, �RcppRedis�, �rDEA�, �RDieHarder�, �redland�, �redux�, �rgdal�, �rggobi�, �Rglpk�, �Rhpc�, �rjags�, �rLindo�, �RmecabKo�, �Rmosek�, �rMouse�, �Rmpi�, �RNetCDF�, �RODBC�, �ROracle�, �rpanel�, �Rpoppler�, �RProtoBuf�, �RQuantLib�, �RSAP�, �Rsymphony�, �runjags�, �RVowpalWabbit�, �rzmq�, �sdols�, �seewave�, �shallot�, �smacof�, �sodi [... truncated]
    3: In install.packages(pkgs = doing, lib = lib, ...) :
      installation of one or more packages failed,
    probably �bgx�, �BiocSklearn�, �ChemmineOB�, �dSimer�, �facopy�, �flipflop�, �HilbertVisGUI�, �rsbml�, �rTANDEM�, �xps�, �bamboo�, �bayesCL�, �bioacoustics�, �biospear�, �BRugs�, �cld3�, �clpAPI�, �cplexAPI�, �cudaBayesreg�, �glpkAPI�, �gpg�, �gpuR�, �h5�, �HierO�, �jqr�, �keyring�, �kmcudaR�, �ldat�, �loon�, �magick�, �mongolite�, �odbc�, �OpenCL�, �pbdMPI�, �pbdPROF�, �pcaL1�, �pdftools�, �permGPU�, �proj4�, �protolite�, �qtbase�, �Rcplex�, �RcppAPT�, �RcppRedis�, �rDEA�, �RDieHarder�, �redland�, �redux�, �rgdal�, �rggobi�, �Rglpk�, �Rhpc�, �rjags�, �rLindo�, �RmecabKo�, �Rmosek�, �rMouse�, �Rmpi�, �RNetCDF�, �RODBC�, �ROracle�, �rpanel�, �Rpoppler�, �RProtoBuf�, �RQuantLib�, �RSA [... truncated]
    4: In install.packages(setdiff(cran.pkgs, rownames(installed.packages())),  :
    installation of one or more packages failed,
    probably �bamboo�, �bayesCL�, �bioacoustics�, �biospear�, �BRugs�, �cld3�, �clpAPI�, �cplexAPI�, �cRegulome�, �cudaBayesreg�, �glpkAPI�, �gpg�, �gpuR�, �h5�, �HierO�, �jqr�, �keyring�, �kmcudaR�, �ldat�, �loon�, �magick�, �mongolite�, �odbc�, �OpenCL�, �pbdMPI�, �pbdPROF�, �pcaL1�, �pdftools�, �permGPU�, �proj4�, �protolite�, �qtbase�, �Rcplex�, �RcppAPT�, �RcppRedis�, �rDEA�, �RDieHarder�, �redland�, �redux�, �rgdal�, �rggobi�, �Rglpk�, �Rhpc�, �rjags�, �rLindo�, �RmecabKo�, �Rmosek�, �rMouse�, �Rmpi�, �RNetCDF�, �RODBC�, �ROracle�, �rpanel�, �Rpoppler�, �RProtoBuf�, �RQuantLib�, �RSAP�, �Rsymphony�, �runjags�, �RVowpalWabbit�, �rzmq�, �sdols�, �seewave�, �shallot�, �smacof�, �sodi [... truncated]


LOG
---

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

    VERSION=3.5.0
    CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
    cd /sw/apps
    mkdir -p R_packages
    cd R_packages/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    cd $CLUSTER/
    export R_LIBS_USER=$PWD
    module load R/$VERSION
    module load build-tools
    module load autoconf/2.69
    module load automake/1.14.1
    module load m4/1.4.17
    module load MariaDB/10.1.29
    module load PostgreSQL/10.3
    module load UDUNITS/2.2.26  # these further modules were added
    module load GDAL/2.1.0
    module load Poppler/0.54.0
    module load JAGS/4.3.0
    echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"

The build tools modules are required for some more recent configure scripts
within R packages.  MariaDB (*this 10.1.x version*, not 10.2.x) is required for
installing the `RMySQL` package, which is needed as a prereq by several
BioConductor packages.  We also load `PostgreSQL/10.3` for the same reason for
`RPostgreSQL`.

The installation of `formattable` and `kableExtra` requires
`ImageMagick/6.9.9-35` with rsvg support.  Compiling against that tool requires
a lot of other modules that we don't want to have loaded for the general
installation. See below for this special case.

Loading R loads a bunch of stuff including gcc that will be used for building
R packages.  So, like with perl_modules, R_packages is associated with a
specific R module version.  Make sure you are using R/3.4.3:

    which R

and run R:

    R --no-init-file


Within R
--------

Now, within R, install this packages from CRAN, ensuring that it was installed
within this R_packages tree:

    install.packages('getopt', dependencies=TRUE)

In another shell outside R (substituting `VERSION` and `CLUSTER`):

    ls -l /sw/apps/R_packages/$VERSION/$CLUSTER




After checking that was installed within the appropriate R_packages tree,
continue with these, including some from BioConductor.  Note that specifying
`dependencies=TRUE` seems to indicate that, at least for some packages, if the
dependencies can't be installed, then the package won't be installed.  For
that reason, we install the packages twice, once with `dependencies=TRUE` and
once without.

    # back up a gcc major version
    module load gcc/6.2.0
    R
    install.packages('uroot')
    q()
    module load gcc77.3.0
    R

    cran.packages = c('Rcpp','ggplot2','tidyr','hexbin','lmerTest','microbenchmark','xtable','testthat','DBI','VennDiagram','ade4','adegenet','vegan','ape','assertthat','akima','bitops','boot','caTools','chron','combinat','data.table','reshape2','kernlab','foreach','geiger','dplyr','picante','plyr','pvclust','rmarkdown','permute','markdown','plotrix','openssl','curl','seqinr','stringr','survival','vegan','whisker','zoo','maps','mvtnorm','dendextend','cluster','naturalsort','gplots','tkrplot','tmod','Lahman','RJSONIO','ecodist','gee','hflights','igraph','optparse','proto','reshape','mixOmics','vcfR','EMT','forecast','devtools','withr','rlang','car','gclus','gam','RcppGSL','rstan','RMySQL','RPostgreSQL','gsalib','qqman','manhattanly','GenABEL','FactoMineR','OxyBS','heatmap3','metap','MAd','metafor')
    install.packages(cran.packages, dependencies=TRUE, Ncpus=8)
    install.packages(cran.packages, Ncpus=8)

    source('https://bioconductor.org/biocLite.R')
    biocLite()
    bioc.packages = c('ggtree','Rhtslib','zlibbioc','edgeR','DEXSeq','goseq','GO.db','reactome.db','Gviz','org.Mm.eg.db','sva','dada2','DESeq','DESeq2','limma','AnnotationDbi','impute','preprocessCore','MODA','ROC','TCC','baySeq','multtest','phyloseq','DiffBind','ChIPpeakAnno','csaw','tximport','Glimma','MultiAssayExperiment','scater','scran','ChIPQC','chipseq','htSeqTools','ChIPQC','chipseq','htSeqTools','SNPRelate','chimeraviz','bumphunter','minfi','GEOquery','IlluminaHumanMethylation450kmanifest','IlluminaHumanMethylation450kanno.ilmn12.hg19','ChAMP','GeneOverlap','lumi','missMethyl')
    biocLite(bioc.packages, dependencies=TRUE, Ncpus=8)
    biocLite(bioc.packages, Ncpus=8)

Installing the Bioconductor package `ChAMP` resulted in a curious message during preparation for lazy loading:

    Error in dyn.load(file, DLLpath = DLLpath, ...) :
      unable to load shared object '/pica/sw/apps/R_packages/3.4.3/milou/robustbase/libs/robustbase.so':
      `maximal number of DLLs reached...
    ERROR: lazy loading failed for package 'ChAMP'

The base limit for R is 100 DLLs, and since R 3.4.0 there is an environment
variable that can be set to make this higher
(<https://stackoverflow.com/questions/36974206/error-maximal-number-of-dlls-reached>).
We will now set `R_MAX_NUM_DLLS` to 200 in the mf file of `R/3.4.0` and all later R versions.

See the README for 3.3.0 if you get the messages about instruction problems or
too-new or too-old BioConductor packages when using `biocLite`.  Short answer:
do not update packages.


Adding a new package
---------------

Do everything above between lines 16 and 33, from `VERSION=` through `echo -e`.  Load R, then

    new.packages = c('package_a')
    install.packages(new.packages, dependencies=TRUE, Ncpus=8)
    install.packages(new.packages, Ncpus=8)

For bioconductor,

    new.packages = c('package_a')
    source('https://bioconductor.org/biocLite.R')
    biocLite()
    biocLite(new.packages, dependencies=TRUE, Ncpus=8)
    biocLite(new.packages, Ncpus=8)


Installation which requires additional modules
----------------------------------------------

A few R packages or their dependencies require some further loads:
`formattable`, `kableExtra`, `magick`.  This requires some additional
module loads that were left out of the general compilation.

Outside R, load modules then run R:

    module load ImageMagick/6.9.9-35
    module load giflib/5.1.4
    #  module load Poppler/0.54.0  # does not need to be loaded, already loaded earlier
    R

For installing magick, I had to back up to gcc/6.2.0 when building, then move forward.

    module load gcc/6.2.0
    R
    install.packages('magick')
    q()
    module load gcc/7.3.0

    R

Install the rest.  The `tesseract` dependency won't be installable unless this OCR system
is eventually installed at Uppmax.  Should be no problem to leave it out.

    xtra.list = c('formattable','kableExtra')
    install.packages(xtra.list, dependencies=TRUE, Ncpus=8)
    install.packages(xtra.list, Ncpus=8)


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

    ASCAT_VERSION=2.5.1
    [[ -f ASCAT_${ASCAT_VERSION}.tar.gz ]] || wget --timestamping https://github.com/Crick-CancerGenomics/ascat/releases/download/v${ASCAT_VERSION}/ASCAT_${ASCAT_VERSION}.tar.gz
    R CMD INSTALL ASCAT_${ASCAT_VERSION}.tar.gz

Also, install an outdated package `igraph0`, which has been superseded by
`igraph` (installed above) but needed by some older procedures.

    IGRAPH0_VERSION=0.5.7
    [[ -f igraph0_${IGRAPH0_VERSION}.tar.gz ]] || wget --timestamping https://cran.r-project.org/src/contrib/Archive/igraph0/igraph0_${IGRAPH0_VERSION}.tar.gz
    R CMD INSTALL igraph0_${IGRAPH0_VERSION}.tar.gz


After adding new packages
-------------------------

Within R, get a list of installed packages and their versions.  This
modification produces a case-insensitive sorted list.

    ip <- as.data.frame(installed.packages()[, c(1, 3:4)])
    rownames(ip) <- NULL
    ip <- ip[is.na(ip$Priority), 1:2, drop=FALSE]
    print(ip[order(tolower(ip$Package)),], row.names=FALSE)

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

