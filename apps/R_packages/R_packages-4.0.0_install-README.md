R_packages/4.0.0
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

    VERSION=4.0.0
    CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
    cd /sw/apps
    mkdir -p R_packages
    cd R_packages/
    mkdir -p $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL; done
    cd $CLUSTER/
    export R_LIBS_USER=$PWD
    module load R/$VERSION
    module load autoconf/2.69
    module load automake/1.14.1
    module load cmake/3.13.2    # some packages require a newish cmake
    module load m4/1.4.17
    module load MariaDB/10.1.29
    module load PostgreSQL/10.3
    module load UDUNITS/2.2.26  # these further modules were added
    module load GDAL/3.1.0
    module load PROJ/6.3.2
    module load Poppler/0.75.0
    module load JAGS/4.3.0
    module load gsl/2.6
    module load libcurl/7.45.0   # there is a bug in the most recent libcurl preventing the 'curl' package from getting build
    echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"

Various other packages will be loaded when R/4.0.0 is loaded such as `gcc/9.3.0`, `texinfo/6.6` and `java/sun_jdk1.8.0_151`.

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

and run R, setting it up to use the Sweden repository:

    R --no-init-file

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r)


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
    BiocManager::install('https://cran.r-project.org/src/contrib/Archive/refGenome/refGenome_1.7.7.tar.gz', dependencies=TRUE, Ncpus=20)
    BiocManager::install('https://cran.r-project.org/src/contrib/Archive/rbamtools/rbamtools_2.16.17.tar.gz', dependencies=TRUE, Ncpus=20)

to get it installed.

Make sure that `/sw/apps/R_packages/$VERSION/inst.R` is available, then

    source("../inst.R")

This installs all Bioconductor, then all CRAN packages, iteratively until there is no change.


Installation which requires additional modules
----------------------------------------------

A few R packages or their dependencies require some further loads.


### magick

`formattable`, `kableExtra`, `magick`.  This requires some additional
module loads that were left out of the general compilation.

Outside R, load modules then run R:

    module load ImageMagick/6.9.9-35
    module load giflib/5.1.4
    #  Poppler is already loaded

For installing magick, I had to back up to gcc/6.2.0 when building, then move forward.

    module load gcc/6.2.0
    R --no-init-file

and within R:

    r <- getOption("repos")
    r["CRAN"] <- "https://ftp.acc.umu.se/mirror/CRAN/"
    options(repos = r)
    install.packages('magick')
    q()

then:

    module unload ImageMagick giflib
    module load gcc/9.3.0

    R

Install the rest.  The `tesseract` dependency won't be installable unless this OCR system
is eventually installed at Uppmax.  Should be no problem to leave it out.

    xtra.list = c('formattable','kableExtra')
    install.packages(xtra.list, dependencies=TRUE, Ncpus=8)
    install.packages(xtra.list, Ncpus=8)


### xps

The `xps` module requires ROOT, I have installed `ROOT/6.20.4`.

    module load ROOT/6.20.4
    R

and then inside R:

    BiocManager::install('xps')


### hdf5r

The `hdf5r` module required a newer version of HDF5 than was on the system, so
load `hdf5/1.10.5` and install it with that loaded.  Checking the shared object
shows that it has proper RPATH info so the `hdf5` module does not need to be
loaded.  Add a message to the mf indicating that it should be loaded if
building against it, possibly.

    wget https://cran.r-project.org/src/contrib/hdf5r_1.3.2.tar.gz
    module load hdf5/1.10.5
    R CMD INSTALL hdf5r_1.3.2.tar.gz
    mv hdf5r_1.3.2.tar.gz ../../external_tarballs/
    module unload hdf5
    ldd hdf5r/libs/hdf5r.so



Interim updates
---------------

If updating an R package from CRAN or BioConductor, simply use `BiocManager::install(...)` within R.



Updating existing packages in this module
-----------------------------------------

Note that after installing some packages, the existence of additional updates
might be announced.  It is OK to accept these updates; updates to the base R
packages has write permissions are locked down on the R module itself so those
can't be updated.  Be sure to update the list of installed packages.

Do not update base R packages.  See the following section if you get the
message about updating base backages such as Matrix, mgcv, nlme, and survival.

Quit R, save the environment.


Do not update base R packages unless this accompanies a new installtion of R/$VERSION
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
* For an "expired" CRAN package that is still in its archive, see igraph0.
* For a "custom" R package that is part of another module, see dnase2tf.  This latter one uses a command within R.


### LDna

A github package.

    devtools::install_github("petrikemppainen/LDna", ref = 'master')


### velocyto.R

This needed `hdf5r` installed, see above.  It also expects boost to be in a
system location, so we must load a boost module and install velocyto.R from my
own fork so that it recognises `BOOST_ROOT`.

Outside R, load the boost module compatible with the version of gcc used to build R:

    module load boost/1.70.0-gcc9.1.0

Then inside R:

    devtools::install_github("douglasgscofield/velocyto.R")

And verify outside R:

    module unload boost
    ldd /sw/apps/R_packages/4.0.0/rackham/velocyto.R/libs/velocyto.R.so


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


### dnase2tf

Added the module dnase2tf from the source under source tree directory for
calcDFT/1.0.1 Inside R (3.6.0):

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
    STITCH_VERSION=1.6.3
    [[ -f STITCH_${STITCH_VERSION}.tar.gz ]] || wget --timestamping https://github.com/rwdavies/STITCH/releases/download/${STITCH_VERSION}/STITCH_${STITCH_VERSION}.tar.gz
    R CMD INSTALL STITCH_${STITCH_VERSION}.tar.gz


### SAIGE

Install SAIGE, which is an R package with Scalable and Accurate Implementation
of Generalized mixed model (Chen, H. et al. 2016). It accounts for sample
relatedness and is feasible for genetic association tests in large cohorts and
biobanks (N > 400,000).

<https://github.com/weizhouUMICH/SAIGE>

Building from source did not work well: compiling the source distribution via
installation with `R CMD INSTALL` is a mess.  As we're not going to install
this via an image, I will use the prebuilt binary which includes the
shared library `SAIGE.so`.

Version 0.35.8.8, the first version we installed, required
`libboost_iostreams.so.1.58.0`, so I compiled that version of boost and updated
the RPATH information in `SAIGE.so` to find it directly.  Version 0.36.2 does
not use that library, instead it links to `libopenblas.so.0`.  It appears that
our module openblas/0.2.19 will satisfy this.  We have both multi- and single-threaded versions of this library.
From <http://eagle.r-forge.r-project.org/multithreadR.html> I am guessing that SAIGE is linking to this library to get
multithreaded speedups.  So, I'll update its RPATH to point to the multichreaded version, which is `$OPENBLAS_ROOT/lib/libopenblas.so.0`.

    mkdir -p /sw/apps/R_packages/external_tarballs
    cd /sw/apps/R_packages/external_tarballs
    SAIGE_VERSION=0.36.2
    [[ -f SAIGE_${SAIGE_VERSION}_R_x86_64-pc-linux-gnu.tar.gz ]] || wget --timestamping https://github.com/weizhouUMICH/SAIGE/releases/download/${SAIGE_VERSION}/SAIGE_${SAIGE_VERSION}_R_x86_64-pc-linux-gnu.tar.gz
    R CMD INSTALL SAIGE_${SAIGE_VERSION}_R_x86_64-pc-linux-gnu.tar.gz
    cd /sw/apps/R_packages/4.0.0/rackham/SAIGE/libs/
    ldd SAIGE.so
    module load patchelf/0.10
    module load openblas/0.2.20
    patchelf --print-rpath SAIGE.so
    patchelf --set-rpath $OPENBLAS_ROOT/lib SAIGE.so
    patchelf --print-rpath SAIGE.so
    module unload openblas patchelf
    ldd SAIGE.so

This package also contains example scripts and data in an `extdata/` directory
that are heavily referenced in its documentation.  They are wrappers for
the functions provided in the package, and many users will want to use
these scripts directly.  They are not included in the binary download, so
download the source package and rename it to include SAIGE, lift this directory
out into the installation directory, and document how to access them in the
module help.

    cd /sw/apps/R_packages/external_tarballs
    [[ -f SAIGE_${SAIGE_VERSION}.tar.gz ]] || wget -O SAIGE_${SAIGE_VERSION}.tar.gz --timestamping https://github.com/weizhouUMICH/SAIGE/archive/${SAIGE_VERSION}.tar.gz
    tar xzvf SAIGE_${SAIGE_VERSION}.tar.gz SAIGE-${SAIGE_VERSION}/extdata 
    mv SAIGE-${SAIGE_VERSION}/extdata /sw/apps/R_packages/$VERSION/$CLUSTER/SAIGE/
    rmdir SAIGE-${SAIGE_VERSION}


### MDInstruments, MRPracticals, TwoSampleMR

Install github-hosted packages MDInstruments and MRPracticals.  Download the
latest releases from <https://github.com/MRCIEU/MRInstruments/releases> and
<https://github.com/WSpiller/MRPracticals>.  Note that MRPracticals does not
have regular releases, and they also require another github-hosted package
called TwoSampleMR.  So, we do the above to set up our R environment and do all
this inside R:
  
    R --no-init-file

and then within R

    library(devtools)
    install_github(c("MRCIEU/TwoSampleMR","MRCIEU/MRInstruments"))
    install_github("WSpiller/MRPracticals",build_opts = c("--no-resave-data", "--no-manual"),build_vignettes = TRUE)

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

