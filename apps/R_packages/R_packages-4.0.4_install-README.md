R_packages/4.0.4
================

Module holding installations of CRAN and BioConductor.  An attempt to be
comprehensive.  We can't be completely, because we don't have certain
libraries, Oracle, GPUs, etc. installed, nor did I load specialist modules that
might be connectable.

I'll pick those up by hand afterward.  I want to make sure everything that a
user has requested is definitely installed.

I rewrote scripts `/sw/apps/R_packages/3.6.0/inst.R` (do the installing) and
`/sw/apps/R_packages/3.6.0/installed.R` (count the installs, or produce a table
of the installs).  The `biocLite()` mechanism for BioConductor is deprecated,
in favour of a new `BiocManager` package available via CRAN.

In the process, I found that BioConductor repositories included CRAN, so now
break the numbers out into CRAN and BioConductor-specific with no CRAN overlap.

See the note in the install for R_packages/3.5.0 for `R_MAX_NUM_DLLS`.


Packages not picked up in the automated install
-----------------------------------------------

A lot of packages are installed by the automated install, following the
instructions below.  There are still some that do not.


LOG
---

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

    VERSION=4.0.4
    CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
    cd /sw/apps
    mkdir -p R_packages
    cd R_packages/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    VERSIONDIR=$PWD
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL; done
    cd $CLUSTER/
    export R_LIBS_USER=$PWD
    module load R/$VERSION
    module load autoconf/2.69
    module load automake/1.14.1
    module load cmake/3.17.3
    module load m4/1.4.17
    module load MariaDB/10.1.29
    module load PostgreSQL/10.3
    module load UDUNITS/2.2.26  # these further modules were added
    module load GDAL/3.1.0
    module load PROJ/6.3.2
    module load GEOS/3.9.1-gcc9.3.0
    module load openbabel/3.1.1-gcc9.3.0
    module load zlib/1.2.11
    module load hdf5/1.10.5
    module load netcdf/4.7.1
    module load protobuf/3.15.5-gcc9.3.0
    module load Eigen/3.3.4
    module load cyrus-sasl/2.1.27
    module load FFmpeg/4.4
    module load jq/1.6
    module load Tcl-Tk/8.6.11
    module load Poppler/0.75.0
    module load JAGS/4.3.0
    module load gsl/2.6
    module load libcurl/7.45.0   # there is a bug in the most recent libcurl preventing the 'curl' package from getting build
    module load libwebp/1.2.0
    module load glpk/4.65
    module load COIN-OR-OptimizationSuite/1.8.0
    setenv DOWNLOAD_STATIC_LIBV8=1
    echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"

Various other packages will be loaded when R/4.0.4 is loaded such as `gcc/9.3.0`, `texinfo/6.6` and `java/sun_jdk1.8.0_151`.

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
specific R module version.  Make sure you are using R/4.0.0:

    which R

and run R, setting it up to use the Sweden repository, and to have a longer
timeout limit (300 instead of 60 sec):

    R --no-init-file

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r, timeout = 300)



Within R
--------

Now, within R, install this packages from CRAN, ensuring that it was installed
within this R_packages tree:

    if (!requireNamespace("BiocManager"))
        install.packages("BiocManager")
    BiocManager::install()
    BiocManager::install('getopt', dependencies=TRUE, Ncpus=8)

In another shell outside R (substituting `VERSION` and `CLUSTER`):

    ls -l /sw/apps/R_packages/$VERSION/$CLUSTER



Installing all packages
-----------------------

Later packages in BioConductor require `rbamtools`, which requires `refGenome`, both of which are orphaned and not in CRAN, so do

    BiocManager::install(c('doBy','RSQLite','DBI'), dependencies=TRUE, Ncpus=20)
    install.packages('https://cran.r-project.org/src/contrib/Archive/refGenome/refGenome_1.7.7.tar.gz', dependencies=TRUE, Ncpus=20)
    install.packages('https://cran.r-project.org/src/contrib/Archive/rbamtools/rbamtools_2.16.17.tar.gz', dependencies=TRUE, Ncpus=20)

to get it installed.

Make sure that `/sw/apps/R_packages/$VERSION/inst.R` is available, then

    source("../inst.R")

This installs all Bioconductor, then all CRAN packages, iteratively until there is no change.

This was followed by installing the below packages under their particular headings.

Then, a single run of the steps in inst.R to get another listing of packages
that could not be installed. This output is `sink()`d to 20210409.out and will
be consulted after the round of installations.



Installation which requires additional modules
----------------------------------------------

A few R packages or their dependencies require some further loads.


### baseflow, gifski

Requires rust/1.43.1.

    module load rust/1.43.1

Inside R:

    BiocManager::install(c("baseflow","gifski"), dependencies=TRUE)

Outside R:

    module unload rust

This rust module version should also be noted in the module help where we mention baseflow.



### sodium

Load the libsodium module.

Outside R:

    module load libsodium/1.0.18-stable

Inside R:

    BiocManager::install(c("sodium"), dependencies=TRUE)

Outside R:

    module unload -libsodium

This libsodium module version should also be noted in the module help.


### clustermq, rzmq

Load the libzmq module.

Outside R:

    module load libzmp/4.3.4

Inside R:

    BiocManager::install(c("clustermq","rzmq"), dependencies=TRUE)

Outside R:

    module unload -libzmq

This libzmq module version should also be noted in the module help.


### Rmpi, Rhpc, bigGP, doMPI, metaMix, regRSM

Load the most common openmpi module for the gcc version used by R.  In this case, R/4.0.0 loads gcc/9.3.0.  There is an openmpi/4.0.2 and openmpi/4.0.3, but there is also openmpi/3.1.5, which is a more established major version.  That is what we'll load

This also installs four (and counting) modules that depend on Rmpi.

Outside R:

    module load openmpi/3.1.5

Inside R:

    BiocManager::install(c("Rmpi","Rhpc","bigGP","doMPI","metaMix","regRSM"), dependencies=TRUE)


Outside R:

    module unload openmpi

This openmpi module version should also be noted in the module help.


### magick

`formattable`, `kableExtra`, `magick`.  This requires some additional
module loads that were left out of the general compilation.

Outside R, load modules then run R:

    module load ImageMagick/7.0.11-3
    module load giflib/5.1.4
    #  Poppler is already loaded

    R

and within R:

    BiocManager::install('magick', dependencies=TRUE)
    q()

then:

    module unload ImageMagick giflib

    R

Install the rest.  The `tesseract` dependency won't be installable unless this OCR system
is eventually installed at Uppmax.  Should be no problem to leave it out.

    xtra.list = c('formattable','kableExtra')
    BiocManager::install(xtra.list, dependencies=TRUE, Ncpus=8)


### xps

The `xps` module requires ROOT, I have installed `ROOT/6.22.08`.

    module load ROOT/6.22.08
    R

and then inside R:

    BiocManager::install('xps')

There's a note that xps is facing deprecated status at BioConductor.  The 2017
install instructions also say it wants ROOT 5, but we're not about to install
that.  Seems to install OK with ROOT 6.


### hdf5r

Outside R:

    module load hdf5/1.10.5

Inside R:

    BiocManager::install(c("hdf5r"), dependencies=TRUE)

Outside R:

    module unload hdf5

This hdf5 module version should also be noted in the module help.




Interim updates
---------------

If updating an R package from CRAN or BioConductor, simply use `BiocManager::install(...)` within R.


Updating existing packages in this module
-----------------------------------------

Note that after installing packages while installing this module, the existence
of additional updates might be announced.  It is OK to accept these updates;
updates to the base R packages has write permissions are locked down on the R
module itself so those can't be updated.  Accept 'a' to update all packages.

After the module is fully installed, **do not do this** after interim updates.
Instead say 'n'.

Do not update base R packages.  See the following section if you get the
message about updating base backages such as Matrix, mgcv, nlme, and survival.

Quit R, save the environment.


Do not update base R packages unless this accompanies a new installation of R/$VERSION
-----------------------------

After installations of BioConductor or other packages, R might suggest you
update some base packages.  Unless this is an installation which is accompanying
a new installation of R, always choose 'n' to update NONE of the base
packages.  Unless there is a serious bug, we will only update base packages
along with updating R.


External packages
-----------------

Several R packages found here are not on CRAN or BioConductor, as a result of either user requests or requirements by other modules.

* For a github-hosted package that is not part of CRAN, see ASCAT, rrbgen or STITCH.  If the instructions of the package recommend using something like `devtools::github_install("repository/packagename")`, then the package is one of these.
* For a gitlab-hosted package that is not part of CRAN, see ASCAT, rrbgen or STITCH.  If the instructions of the package recommend using something like `devtools::gitlab_install("repository/packagename")`, then the package is one of these.
* For an "expired" CRAN package that is still in its archive, see igraph0.
* For a "deprecated" BioConductor package that is still in its github repository, see DESeq.
* For a "custom" R package that is part of another module, see dnase2tf.  This latter one uses a command within R.


### MUVR

    devtools::install_gitlab('CarlBrunius/MUVR', dependencies=TRUE)


### DESeq

Deprecated, but several packages still rely on this.  Pull it from the Bioconductor git repository and install it from there.

    cd /sw/apps/R_packages/external_tarballs
    git clone https://git.bioconductor.org/packages/DESeq

Then within R, in the /sw/apps/R_packages/external_tarballs directory,

    install.packages('DESeq', repos=NULL)


### prada, rTANDEM, PGSEA, FunciSNP.data, Roleswitch, easyRNASeq

Deprecated or temporary build problems, but packages still rely on these.  Pull
them from the Bioconductor git repository and install from there.

    cd /sw/apps/R_packages/external_tarballs
    git clone https://git.bioconductor.org/packages/prada
    git clone https://git.bioconductor.org/packages/PGSEA
    git clone https://git.bioconductor.org/packages/rTANDEM
    git clone https://git.bioconductor.org/packages/FunciSNP.data
    git clone https://git.bioconductor.org/packages/Roleswitch
    git clone https://git.bioconductor.org/packages/easyRNASeq

Then within R, in the /sw/apps/R_packages/external_tarballs directory,

    install.packages(c('prada','PGSEA','rTANDEM','FunciSNP.data','Roleswitch','easyRNASeq'), repos=NULL)

Once these are installed, others can be installed. This list is incomplete, so a full reinstall is warranted.

    BiocManager::install(c('facsDorit','FunciSNP','miRLAB'), dependencies=TRUE)


### lme4qtl, harmony, LDna, ampvis2, CaSpER, loomR, SeuratDisk

Github-hosted packages.  Load hdf5/1.10.5 since loomR uses hdf5r.

    devtools::install_github("variani/lme4qtl", ref='master', dependencies=TRUE)
    devtools::install_github("immunogenomics/harmony", ref = 'master')
    devtools::install_github("petrikemppainen/LDna", ref = 'master')
    devtools::install_github("madsalbertsen/ampvis2")
    devtools::install_github("akdess/CaSpER")
    devtools::install_github("mojaveazure/loomR", ref = "develop")
    devtools::install_github("mojaveazure/seurat-disk")


### HDL

A github repository that contains as a subdirectory a CRAN-like repository
directory.  Create a new `external_repositories` directory within VERSIONDIR
and clone the HDL repository there.  **NOTE: there is no need to do this.**

    cd $VERSIONDIR
    mkdir -p external_repositories
    cd external_repositories
    module load git/2.28.0
    git clone https://github.com/zhenin/HDL
    cd HDL

**For 4.0.4** since I copied this directory over from 4.0.0, just do a git pull to
update the repository and install from there.

    cd $VERSIONDIR/external_repositories
    module load git/2.28.0
    cd HDL
    git pull

Then, install the HDL repository from this subdirectory using standard R
procedures.

    R

Within R:

    install.packages("HDL", repos=NULL)

Make sure this loads correctly:

    library(HDL)

The repository also contains some scripts and datasets that the users may wish
to use.  Added a note to the module help, and defined the new mf file variable
`reposroot` to point to `$VERSIONDIR/external_repositories`.


### velocyto.R

No change to the source here since R_packages/4.0.0.  Build with the newer
toolchain though for /4.0.4.

This needed `hdf5r` installed, see above.  It also expects boost to be in a
system location, so we must load a boost module and install velocyto.R from my
own fork so that it recognises `BOOST_ROOT`.

Outside R, load the boost module compatible with the version of gcc used to build R:

    module load boost/1.75.0-gcc9.3.0

Then inside R:

    devtools::install_github("douglasgscofield/velocyto.R")

And verify outside R:

    module unload boost
    ldd /sw/apps/R_packages/4.0.4/rackham/velocyto.R/libs/velocyto.R.so


### ASCAT

Install a non-CRAN package ASCAT, hosted on github.  Download the latest release here (https://github.com/Crick-CancerGenomics/ascat/releases).
  
    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    ASCAT_VERSION=2.5.2
    [[ -f ASCAT_${ASCAT_VERSION}.tar.gz ]] || wget --timestamping https://github.com/Crick-CancerGenomics/ascat/releases/download/v${ASCAT_VERSION}/ASCAT_${ASCAT_VERSION}.tar.gz
    R CMD INSTALL ASCAT_${ASCAT_VERSION}.tar.gz


### igraph0

Also, install an outdated package `igraph0`, which has been superseded by
`igraph` (installed above) but needed by some older procedures.

    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    IGRAPH0_VERSION=0.5.7
    [[ -f igraph0_${IGRAPH0_VERSION}.tar.gz ]] || wget --timestamping https://cran.r-project.org/src/contrib/Archive/igraph0/igraph0_${IGRAPH0_VERSION}.tar.gz
    R CMD INSTALL igraph0_${IGRAPH0_VERSION}.tar.gz

### CoxBoost

A deprecated package at CRAN.

    cd /sw/apps/R_packages/external_tarballs
    COXBOOST_VERSION=1.4
    [[ -f igraph0_${COXBOOST_VERSION}.tar.gz ]] || wget --timestamping https://cran.r-project.org/src/contrib/Archive/CoxBoost/CoxBoost_${COXBOOST_VERSION}.tar.gz
    R CMD INSTALL CoxBoost_${COXBOOST_VERSION}.tar.gz



### dnase2tf

Added the module dnase2tf from the source under source tree directory for
calcDFT/1.0.1.

Inside R:

    install.packages('/sw/bioinfo/calcDFT/1.0.1/src/dnase2tf', repos = NULL, type="source")


### rrbgen

Install rrbgen for reading BGEN files, hosted on github.

    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    RRBGEN_VERSION=0.0.6
    [[ -f rrbgen_${RRBGEN_VERSION}.tar.gz ]] || wget --timestamping https://github.com/rwdavies/rrbgen/releases/download/${RRBGEN_VERSION}/rrbgen_${RRBGEN_VERSION}.tar.gz
    R CMD INSTALL rrbgen_${RRBGEN_VERSION}.tar.gz


### STITCH

Install STITCH for haplotype imputation, hosted on github.  I was worried about
its requirement for htslib but it has incorporated that into its own source
tree.  This module also requires both `bgzip` and `tabix`, which are provided
by `htslib/1.8`.

    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    STITCH_VERSION=1.6.5
    [[ -f STITCH_${STITCH_VERSION}.tar.gz ]] || wget --timestamping https://github.com/rwdavies/STITCH/releases/download/${STITCH_VERSION}/STITCH_${STITCH_VERSION}.tar.gz
    R CMD INSTALL STITCH_${STITCH_VERSION}.tar.gz


### SAIGE

**NOTE** SAIGE is now installed in its own module, SAIGE/0.42.1 on its first installation.


### MDInstruments, MRPracticals, TwoSampleMR

Install github-hosted packages MDInstruments and MRPracticals.  Download the
latest releases from <https://github.com/MRCIEU/MRInstruments/releases> and
<https://github.com/WSpiller/MRPracticals>.  Note that MRPracticals does not
have regular releases, and they also require another github-hosted package
called TwoSampleMR.  So, we do the above to set up our R environment and do all
this inside R:
  
    R --no-init-file

and then within R

    devtools::install_github(c("MRCIEU/TwoSampleMR","MRCIEU/MRInstruments"))
    devtools::install_github("WSpiller/MRPracticals",build_opts = c("--no-resave-data", "--no-manual"),build_vignettes = TRUE)


### EasyQC

    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    EASYQC_VERSION=9.2
    [[ -f EasyQC_${EASYQC_VERSION}.tar.gz ]] || wget --timestamping https://homepages.uni-regensburg.de/~wit59712/easyqc/EasyQC_${EASYQC_VERSION}.tar.gz
    R CMD INSTALL EasyQC_${EASYQC_VERSION}.tar.gz

    wget --timestamping https://homepages.uni-regensburg.de/~wit59712/easyqc/EasyQC_9.0_Commands_140918_2.pdf


Adding a new package
---------------

Do everything above between lines 16 and 33, from `VERSION=` through `echo -e`.
Load R, then for both CRAN and BioConductor packages, we use
`BiocManager::install()` which ultimately uses R's own `install.packages()`.


    new.packages = c('package_a')
    if (! requireNamespace("BiocManager"))
        install.packages("BiocManager")
    BiocManager::install(new.packages, dependencies=TRUE, Ncpus=10)
    BiocManager::install(new.packages, Ncpus=10)



After adding new packages
-------------------------

Within R, get a list of installed packages and their versions.  This
modification produces a case-insensitive sorted list.

    cd /sw/apps/R_packages/$VERSION 
    ./installed.R -c | tee counts.txt
    ./installed.R -t > table.txt
    ../create_html_table.pl table.txt > table.html

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

