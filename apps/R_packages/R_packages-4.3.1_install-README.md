R_packages/4.3.1
================

For the next version:

* GenomicsDB ??
* https://github.com/mojaveazure/seurat-disk
* and double-check Seurat's own website for its recommended additions for externals
* remotes::install_github('chris-mcginnis-ucsf/DoubletFinder', upgrade='never')
  Be sure that DoubletFinder includes changes to accomodate Seurat:

    cd /sw/apps/R_packages
    source SOURCEME_R_packages_4.3.1
    source $VERSIONDIR/source-for-setup
    cd $VERSIONDIR/external
    ml git/2.34.1
    git clone --recursive https://github.com/chris-mcginnis-ucsf/DoubletFinder
    cd DoubletFinder/
    cd R/
    wget -O paramSweep.R.new https://raw.githubusercontent.com/chris-mcginnis-ucsf/DoubletFinder/57e1a43820ecbf8b371b104879e64976a83f9e8b/R/paramSweep.R
    wget -O doubletFinder.R.new https://raw.githubusercontent.com/chris-mcginnis-ucsf/DoubletFinder/642322aab3a50b2ad1892e2bbd8ac98a5191a18f/R/doubletFinder.R
    diff doubletFinder.R*
    diff paramSweep.R*
    mv doubletFinder.R.new doubletFinder.R
    mv paramSweep.R.new paramSweep.R
    cd ../..

  Then within R:

    install.packages('DoubletFinder', repos=NULL)


Intro
-----

Double-check that there are no non-base packages installed within R/4.3.1. That
must be chmod -R -w, but I'd forgotten and other AEs had installed packages
there. Big mistake.

Also, the new timeout of 500 seconds (see below) was too short to install e.g.,
stringi. So, extend to 30 mins = 1800 seconds.


Used under license:
Various


Structure creating script (makeroom_R_packages_4.3.1.sh) moved to /sw/apps/R_packages/makeroom_4.3.1.sh

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
instructions below.  There are still some that are not.  Some require some
hand-holding, loading additional/alternate modules, etc. Some simply do
not install.


To install new packages
-----------------------

First, do

    source $VERSIONDIR/source-for-setup

Then do the installation, however it's needed.  See 'Adding a new package' below.

### Interim updates

If updating an R package from CRAN or BioConductor, simply use `BiocManager::install(..., update=FALSE)` within R.


### Updating existing packages in this module

Note that after installing packages while installing this module, the existence
of additional updates might be announced.  It is OK to accept these updates;
updates to the base R packages has write permissions are locked down on the R
module itself so those can't be updated.  Accept 'a' to update all packages.

After the module is fully installed, **do not do this** after interim updates.
Instead say 'n'.

Do not update base R packages.  See the following section if you get the
message about updating base backages such as Matrix, mgcv, nlme, and survival.

Quit R, save the environment.


### Do not update base R packages unless this accompanies a new installation of R/$VERSION

After installations of BioConductor or other packages, R might suggest you
update some base packages.  Unless this is an installation which is accompanying
a new installation of R, always choose 'n' to update NONE of the base
packages.  Unless there is a serious bug, we will only update base packages
along with updating R.



LOG
---

Set up.

    makeroom.sh -f -c apps -t R_packages -v 4.3.1 -d "Omnibus package containing installations of as many R packages from CRAN, BioConductor and other user-requested sources as can be reasonably installed" -l Various 
    ./makeroom_R_packages_4.3.1.sh 
    source /sw/apps/R_packages/SOURCEME_R_packages_4.3.1 && cd $TOOLDIR

Run these commands to start the installation, and also run these commands for
setting up prior to adding new packages to this installation.

Place these in `$VERSIONDIR/source-for-setup` for future use.

    source /sw/apps/R_packages/SOURCEME_R_packages_4.3.1 && cd $VERSIONDIR
    export R_LIBS_USER=$PREFIX

    module load R/$VERSION

Several modules will be loaded as prereqs when R/4.3.1 is loaded.  Do **NOT**
load these with the modules below, let them come in when loading R/4.3.1. Pay
attention if there are any version incompatibilities when loading the additional
modules liated after the build (autoconf, automake, cmake, m4) modules and
correct them.

    gcc/12.3.0
    java/OpenJDK_17+35
    cairo/1.17.4
    texinfo/6.8
    texlive/2023-08-14
    libcurl/7.85.0
    readline/6.2-11
    libicu/5.2-4
    xz/5.2.6
    bzip2/1.0.8
    zlib/1.2.12


Load build systems.

    module load autoconf/2.69
    module load automake/1.16.1
    module load cmake/3.26.3
    module load m4/1.4.17

Load other prereqs for building the package tree.

    module load COIN-OR-OptimizationSuite/1.8.0
    module load cyrus-sasl/2.1.28
    module load Eigen/3.3.4
    module load FFmpeg/5.1.2
    module load GDAL/3.7.2
    module load GEOS/3.12.0-gcc12.3.0
    module load git/2.34.1
    module load glpk/5.0
    module load gsl/2.7
    module load hdf5/1.14.0
    module load JAGS/4.3.1
    module load jq/1.6
    module load libSBML/5.20.0
    module load libwebp/1.3.0
    module load MariaDB/10.1.29
    module load netcdf/4.9.2
    module load openbabel/3.1.1-gcc12.3.0
    module load Poppler/23.09.0
    module load PostgreSQL/10.3
    module load PROJ/9.1.1
    module load protobuf/24.3-gcc12.3.0
    module load rust/1.67.0
    module load SHAPELIB/1.5.0-20220210-8edf888
    module load Tcl-Tk/8.6.11
    module load UDUNITS/2.2.26
    module load giflib/5.1.4
    module load ImageMagick/7.0.11-3
    module load sqlite/3.34.0
    module load GMP/6.3.0
    module load MPFR/4.2.1
    module load libsodium/1.0.18-stable
    module load OpenBUGS/3.2.3
    module load lz4/1.9.2
    module load libb2/0.98.1
    module load libdeflate/1.19
    module load zstd/1.5.2
    module load szip/2.1.1


Final setup.

    export DOWNLOAD_STATIC_LIBV8=1
    export _R_INSTALL_PACKAGES_ELAPSED_TIMEOUT_=1800
    echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"


The build tools modules are required for some more recent configure scripts
within R packages.  MariaDB (*this 10.1.x version*, not 10.2.x) is required for
installing the `RMySQL` package, which is needed as a prereq by several
BioConductor packages.  We also load `PostgreSQL/10.3` for the same reason for
`RPostgreSQL`.

Several installations require additional modules to be loaded just for that
installation.  See below.

Loading R loads a bunch of stuff including gcc that will be used for building
R packages.  So, like with perl_modules, R_packages is associated with a
specific R module version.  Make sure you are using R/4.3.1:

    which R

and run R, setting it up to use the Umea, Sweden repository, and to have a
longer timeout limit (300 instead of 60 sec):

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
    BiocManager::install(update=FALSE)
    options(BiocManager.check_repositories = FALSE)  # make BioConductor shut up about alternate repositories
    BiocManager::install('getopt', update=FALSE, Ncpus=8)

Temporarily suspend R and double-check that packages are installed into the prefix.

    Ctrl-z
    ls -l $PREFIX
    fg



Installing all packages
-----------------------

Later packages in BioConductor require `rbamtools`, which requires `refGenome`,
both of which are orphaned and not in CRAN.  Also, my two now-archived
packages, and build `rgl` without OpenGL support.

    BiocManager::install(c('doBy','RSQLite','DBI'), update=FALSE, Ncpus=10)
    install.packages('https://cran.r-project.org/src/contrib/Archive/refGenome/refGenome_1.7.7.tar.gz', Ncpus=10)
    install.packages('https://cran.r-project.org/src/contrib/Archive/rbamtools/rbamtools_2.16.17.tar.gz', Ncpus=10)
    install.packages('https://cran.r-project.org/src/contrib/Archive/nestedRanksTest/nestedRanksTest_0.2.tar.gz', Ncpus=10)
    install.packages('rgl', configure.args='--disable-opengl')
    BiocManager::install(c('pegas'), update=FALSE, Ncpus=10)
    install.packages('https://cran.r-project.org/src/contrib/Archive/readGenalex/readGenalex_1.0.tar.gz', Ncpus=10)


to get it installed.

Pre-emptive installations of dependencies in the CRAN archive
-------------------------------------------------------------

Build geo packages that need help finding GEOS, PROJ, GDAL.

      ml libtiff/4.5.0
      ml libcurl/7.85.0

Then within R:

      install.packages('terra', configure.args="--with-gdal-config=$GDAL_ROOT/bin/gdal-config --with-proj-data=$PROJ_DATA --with-sqlite3-lib=$SQLITE3_ROOT/lib --with-proj-include=$PROJ_ROOT/include --with-proj-lib=$PROJ_ROOT/lib --with-proj-share=$PROJ_DATA --with-geos-config=$GEOS_ROOT/bin/geos-config")
      install.packages('gdalraster', configure.args="--with-gdal-config=$GDAL_ROOT/bin/gdal-config --with-proj-data=$PROJ_DATA --with-sqlite3-lib=$SQLITE3_ROOT/lib --with-proj-include=$PROJ_ROOT/include --with-proj-lib=$PROJ_ROOT/lib --with-proj-share=$PROJ_DATA --with-geos-config=$GEOS_ROOT/bin/geos-config")
      install.packages('sf', configure.args="--with-gdal-config=$GDAL_ROOT/bin/gdal-config --with-proj-data=$PROJ_DATA --with-sqlite3-lib=$SQLITE3_ROOT/lib --with-proj-include=$PROJ_ROOT/include --with-proj-lib=$PROJ_ROOT/lib --with-proj-share=$PROJ_DATA --with-geos-config=$GEOS_ROOT/bin/geos-config")
      install.packages('lwgeom', configure.args="--with-gdal-config=$GDAL_ROOT/bin/gdal-config --with-proj-data=$PROJ_DATA --with-sqlite3-lib=$SQLITE3_ROOT/lib --with-proj-include=$PROJ_ROOT/include --with-proj-lib=$PROJ_ROOT/lib --with-proj-share=$PROJ_DATA --with-geos-config=$GEOS_ROOT/bin/geos-config")
      install.packages('gdalcubes', configure.args="--with-gdal-config=$GDAL_ROOT/bin/gdal-config --with-proj-data=$PROJ_DATA --with-sqlite3-lib=$SQLITE3_ROOT/lib --with-proj-include=$PROJ_ROOT/include --with-proj-lib=$PROJ_ROOT/lib --with-proj-share=$PROJ_DATA --with-geos-config=$GEOS_ROOT/bin/geos-config")

Then within R:

    BiocManager::install("Rsamtools", Ncpu=4, update=FALSE)
    BiocManager::install(c('sftime','stars','raster','gstat','exactextractr','rasterVis'), Ncpu=4, update=FALSE)


Try to install everything
-------------------------

Make sure that `/sw/apps/R_packages/$VERSION/inst.R` is available, then to see
what remains, do:

    source("inst.R")

if you are in `$VERSIONDIR`, or whatever is appropriate for the location you are in.

When this started after the above, it printed

    Bioconductor version 3.17 (BiocManager 1.30.22), R 4.3.1 (2023-06-16)
    There are a total of 23455 packages available
    104 CRAN packages installed, out of 19899 available
    1 BioConductor-specific packages installed, out of 3556 available

This installs all Bioconductor, then all CRAN packages, iteratively until there is no change.


### inst.R stalls

After many installs, inst.R stalled. We already know from 4.2.1 that several
packages need access to X during installation, so must be installed outside a
screen.

    https://www.mail-archive.com/r-help@r-project.org/msg263560.html

It looked like a few of these suspects might be involved, so I quit the screen
and directly installed them.

    BiocManager::install(c('bioplotbootGUI','cncaGUI','multibiplotGUI','RcmdrPlugin.PcaRobust','RclusTool'),update=FALSE,Ncpus=10)

Two failed: cncaGUI and multibiplotGUI

Remove lock files:

    rm -rf $PREFIX/00LOCK*

#### cncaGUI

Errors during installation:

    ** byte-compile and prepare package for lazy loading
    sh: line 1: 24796 Segmentation fault      (core dumped) R_TESTS= '/sw/apps/R/4.3.1/rackham/lib64/R/bin/R' --no-save --no-restore --no-echo 2>&1 < '/scratch/RtmpjUJuw3/file5e6b690955dc'
    ERROR: lazy loading failed for package 'cncaGUI'

Installed from the repository.

    cd $VERSIONDIR/external
    wget https://ftp.acc.umu.se/mirror/CRAN/src/contrib/cncaGUI_1.1.tar.gz
    R CMD INSTALL cncaGUI_1.1.tar.gz

Still failed. Check DESCRIPTION to see dependencies, from the Imports line:

    tar xf cncaGUI_1.1.tar.gz
    cd cncaGUI
    grep Imports DESCRIPTION

We see

    Imports: rgl, tkrplot, tcltk, tcltk2, shapes, plotrix, MASS

The `rgl` installation above failed, so try again, then install the nonbase dependencies.

    install.packages('rgl', configure.args='--disable-opengl')
    install.packages(c('tkrplot','tcltk2','shapes','plotrix'))

Now install cncaGUI using `devtools::install(".")` within the unpacked tarball. This worked!
within the unpacked tarball, and this worked.

#### multibiplotGUI

Will multibiplotGUI install now?

    install.packages('multibiplotGUI')

Yes!


#### archive

Load libarchive/3.6.2 and build


#### MPI packages, such as Rmpi, Rhpc

Only openmpi/4.1.5 is available with gcc/12.3.0

    #  fully quit R

    cd $VERSIONDIR

    ml openmpi/4.1.5

    R --no-init-file
    install.packages(c("Rmpi","bigGP","doMPI","regRSM"))
    # fully quit R

    cd $TOOLDIR/external_tarballs

    # these were already downloaded for 4.2.1

    R CMD INSTALL Rhpc_0.21-247.tar.gz
    R CMD INSTALL metaMix_0.3.tar.gz   # this depends on Rmpi

    ml -openmpi

    cd $VERSIONDIR

#### Packages requiring libzmq: clustermq, rzmq

Latest is still libzmq/4.3.4

    # fully quit R

    ml libzmq/4.3.4

    R --no-init-file
    BiocManager::install(c("clustermq","rzmq"), update=FALSE)
    # fully quit R

    ml -libzmq

#### OpenBUGS and MultiBUGS dependent packages: R2OpenBUGS, BRugs, pbugs

    # fully quit R
    ml OpenBUGS/3.2.3

    R --no-init-file
    BiocManager::install(c("R2OpenBUGS","BRugs"), update=FALSE)
    # fully quit R

    cd $VERSIONDIR/external
    cd pbugs
    git pull  # still to date
    git status # DESCRIPTION still edited
    cd ..

    R --no-init-file
    install.packages('pbugs', repos=NULL)
    ml -OpenBUGS

#### R2MultiBUGS for MultiBUGS/2.0-gcc12.3.0. This also loads openmpi/4.1.5

    # fully quit R
    ml MultiBUGS/2.0-gcc12.3.0

    R --no-init-file
    devtools::install_github("MultiBUGS/R2MultiBUGS")

    # fully quit R

    ml -MultiBUGS



### Restart 

    cd $VERSIONDIR
    ./installed.R -c

produces

    The R_packages/4.3.1 omnibus module for R version 4.3.1 (2023-06-16) and BioConductor version 3.17

    A total of 23173 R packages are installed
    A total of 23478 packages are available in CRAN and BioConductor
    19603 CRAN packages are installed, out of 19919 available
    3530 BioConductor-specific packages are installed, out of 3559 available
    38 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere


Restart installations within R, but **outside a screen** since we are so far along.

    R --no-init-file
    options(BiocManager.check_repositories = FALSE)
    source("inst.R")

When this restart ends, we got just a handful of packages not installed.

    No change in number of packages not installed: 345 so quitting
    After iteration 2 :
    19603 CRAN packages installed, out of 19919 available
    3530 BioConductor-specific packages installed, out of 3559 available
    Warning message:
    In install.packages(...) : installation of 345 packages failed:

Now try to install other dependencies.

    cd $TOOLDIR/external_tarballs/

    R CMD INSTALL rsnps_0.6.0.tar.gz
    R CMD INSTALL spp_1.16.0.tar.gz
    R CMD INSTALL clusterCrit_1.2.8.tar.gz
    R CMD INSTALL kmlShape_0.9.5.tar.gz
    R CMD INSTALL ReorderCluster_2.0.tar.gz
    R CMD INSTALL propr_4.2.6.tar.gz
    R CMD INSTALL EntropyExplorer_1.1.tar.gz
    R CMD INSTALL SPARQL_1.16.tar.gz
    R CMD INSTALL mppa_1.0.tar.gz
    R CMD INSTALL GenKern_1.2-60.tar.gz
    R CMD INSTALL vbsr_0.0.5.tar.gz
    R CMD INSTALL baseflow_0.13.2.tar.gz
    R CMD INSTALL mGSZ_1.0.tar.gz
    R CMD INSTALL sampSurf_0.7-6.tar.gz
    R CMD INSTALL spatstat.core_2.4-4.tar.gz
    R CMD INSTALL captioner_2.2.3.tar.gz

    cd $VERSIONDIR

Try to address some of the ones that couldn't be installed.

  - BGmix
  - biplotbootGUI
  - ChemmineOB
  - cuda.ml
  - DeepBlueR
  - deeptrafo
  - duckdb
  - FlexReg
  - gpg
  - gpuMagic
  - gWidgets2tcltk
  - HIBAG
  - HilbertVisGUI
  - image.textlinedetector
  * iplots
  - JFE
  * loon
  - mlpack
  - networkscaleup
  - odbc
  - OmicsLonDA
  - OpenCL
  - opencv
  - openCyto
  - optbdmaeAT
  - optrcdmaeAT
  * proj4      # load PROJ.4 instead of PROJ when building
  * vol2birdR  # load PROJ.4 instead of PROJ/9.1.1 when building
  - (rawrr)    # nope
  - Rcplex
  - RcppMeCab
  - RcppSimdJson
  - (redland)    # nope
  - (redux)    # nope
  - RmecabKo
  * Rmpfr      # unload everything, then load only R/4.3.1 and set R_LIBS_USER. It will only work with the system mpfr and gmp
  - RODBC
  - ROracle
  * Rpoppler   #  load glib as a Poppler prerequisite
  - RProtoBuf  # turns out, this builds with protobuf/21.12-gcc10.3.0 but not the newer protobuf/24.3-gcc12.3.0 because abseil has a ridiculous number of separately specified libraries and pkg-config gets very confused
  - RQuantLib
  - (rsbml)   # nope
  - rstanarm
  - rswipl
  - soptdmaeA
  * spectralGraphTopology
  - ssh
  - switchboard
  - symengine
  - tesseract
  - tkImgR
  - TTAinterfaceTrendAnalysis
  - uHMM
  * vapour
  * abstr
  * acumos
  - angstroms
  - (truncated)


Examine installation failures using inst1.R
-------------------------------------------

Nor looking at a few of the standard ones that failed, and why, using a single-run script inst1.R.R.

Run this and save the output. Modified from the help for `sink()`.

     zz <- file("inst1.Rout", open = "wt")
     sink(zz)
     sink(zz, type = "message")

     source("inst1.R")

     sink(type = "message")
     sink()

Looks like this is not capturing all of the build output, just the "well behaved" output from R.

Many installed from this list. What are the numbers now?

    ./installed.R -c

Produces

    The R_packages/4.3.1 omnibus module for R version 4.3.1 (2023-06-16) and BioConductor version 3.17

    A total of 23377 R packages are installed
    A total of 23486 packages are available in CRAN and BioConductor
    19790 CRAN packages are installed, out of 19927 available
    3544 BioConductor-specific packages are installed, out of 3559 available
    41 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere

This is enough. Move to the external packages, see below.


#### RcppCGAL and AlphaHull3D are moved to the archive.

      cd $TOOLDIR/external_tarballs
      wget https://cran.r-project.org/src/contrib/Archive/RcppCGAL/RcppCGAL_5.5.3.tar.gz
      wget https://cran.r-project.org/src/contrib/Archive/AlphaHull3D/AlphaHull3D_2.0.0.tar.gz
      R CMD INSTALL RcppCGAL_5.5.3.tar.gz
      R CMD INSTALL AlphaHull3D_2.0.0.tar.gz
      cd $VERSIONDIR

BUT, AlphaHull3D won't build.

    n file included from /sw/apps/R_packages/4.3.1/rackham/RcppCGAL/include/CGAL/Triangulation_3.h:39:
    /sw/apps/R_packages/4.3.1/rackham/RcppCGAL/include/CGAL/Triangulation_segment_traverser_3.h: At global scope:
    /sw/apps/R_packages/4.3.1/rackham/RcppCGAL/include/CGAL/Triangulation_segment_traverser_3.h:371:49: error: expected identifier before string constant
      371 |     std::tuple<Locate_type, int, int>Rcpp::stop("Exit Error") const
            |                                                 ^~~~~~~~~~~~
            /sw/apps/R_packages/4.3.1/rackham/RcppCGAL/include/CGAL/Triangulation_segment_traverser_3.h:371:49: error: expected ',' or '...' before string constant
            /sw/apps/R_packages/4.3.1/rackham/RcppCGAL/include/CGAL/Triangulation_segment_traverser_3.h:371:38: error: invalid use of '::'
              371 |     std::tuple<Locate_type, int, int>Rcpp::stop("Exit Error") const
                    |                                      ^~~~

Punt.


I did a final run of inst1.R outside a screen. Several more packages installed!  `./installed.R -c` results now:

    The R_packages/4.3.1 omnibus module for R version 4.3.1 (2023-06-16) and BioConductor version 3.17

    A total of 23401 R packages are installed
    A total of 23486 packages are available in CRAN and BioConductor
    19814 CRAN packages are installed, out of 19927 available
    3544 BioConductor-specific packages are installed, out of 3559 available
    41 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere





External packages
-----------------

Several R packages found here are not on CRAN or BioConductor, as a result of either user requests or requirements by other modules.

### Basic guidelines

* For a github-hosted package that is not part of CRAN, see ASCAT, rrbgen or STITCH.  If the instructions of the package recommend using something like `devtools::github_install("repository/packagename")`, then the package is one of these.
* For a gitlab-hosted package that is not part of CRAN, see ASCAT, rrbgen or STITCH.  If the instructions of the package recommend using something like `devtools::gitlab_install("repository/packagename")`, then the package is one of these.
* For an "expired" CRAN package that is still in its archive, see igraph0.
* For a "deprecated" BioConductor package that is still in its github repository, see DESeq.
* For a "custom" R package that is part of another module, see dnase2tf.  This latter one uses a command within R.



### cmdstanr

Two steps.  This requires installing the cmdstanr package from a custom repository:

    install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

Then, downloading the latest CmdStan to `$TOOLDIR/external`.  As of this writing, this is

    cd $TOOLDIR/external_tarballs
    [[ -f cmdstan-2.33.1.tar.gz ]] || wget https://github.com/stan-dev/cmdstan/releases/download/v2.33.1/cmdstan-2.33.1.tar.gz

Add wording to module help to use the following:

If you see "Floating point exception" when using functions from the 'brms'
package, it can be more stable when using the option `backend='cmdstanr'`.  The
'cmdstanr' package is installed in this module, but in order to use it, you
must also separately install the tool CmdStan into your home directory. This
can be installed from an UPPMAX-local file using the following commands within
R:

    library(cmdstanr)
    install_cmdstan(release_url="file:///sw/apps/R_packages/external_tarballs/cmdstan-2.33.1.tar.gz")

You can then use the `backend='cmdstanr'` option with brms functions.




### dyno

Make sure ImageMagick and giflib are loaded.

    module load ImageMagick/7.0.11-3 giflib/5.1.4

    devtools::install_github("dynverse/dyno")

This build popped up the message

    >  devtools::install_github("dynverse/dyno")
    >  Using github PAT from envvar GITHUB_PAT
    >  Downloading GitHub repo dynverse/dyno@HEAD
    >  These packages have more recent versions available.
    >  It is recommended to update all of them.
    >  Which would you like to update?
    >
    >  1: All
    >  2: CRAN packages only
    >  3: None
    >  4: dynfeature (1.0.1 -> b6fa729b1...) [GitHub]
    >  5: dynplot    (1.1.2 -> d64b25cd5...) [GitHub]
    >  6: dynwrap    (1.2.3 -> d7233776f...) [GitHub]
    >
    >  Enter one or more numbers, or an empty line to skip updates: 1

Had to choose '1' a couple times to get all packages updated ... wait... is dynverse now part of CRAN ?


### xps  needs ROOT/6.22.08

Pull from Bioconductor git repository and install from their clones.  ROOT/6.26.10 is too recent.  We have to do a little gcc module finesse to use the older ROOT.

    mkdir $VERSIONDIR/external
    cd $VERSIONDIR/external
    git clone https://git.bioconductor.org/packages/xps


    module load ROOT/6.22.08
    module load gcc/12.3.0

Then within R, in the `$VERSIONDIR/external/` directory,

    install.packages('xps', repos=NULL)

Then

    module unload ROOT
    module load gcc/12.3.0



### Archived BioConductor packages

Deprecated or temporary build problems, but packages still rely on these.  Pull
them from the Bioconductor git or tarball repository and install from there.
KEGG.db is superceded by KEGGREST but PGSEA doesn't know that.

    mkdir -p $VERSIONDIR/external
    cd $VERSIONDIR/external
    wget --timestamping http://bioconductor.org/packages/3.11/data/annotation/src/contrib/KEGG.db_3.2.4.tar.gz
    R CMD INSTALL KEGG.db_3.2.4.tar.gz

Instead of doing a fresh clone, just did a `git pull` within each:

    git clone https://git.bioconductor.org/packages/DESeq
    git clone https://git.bioconductor.org/packages/prada
    git clone https://git.bioconductor.org/packages/PGSEA
    git clone https://git.bioconductor.org/packages/rTANDEM
    git clone https://git.bioconductor.org/packages/FunciSNP
    git clone https://git.bioconductor.org/packages/FunciSNP.data
    git clone https://git.bioconductor.org/packages/Roleswitch
    git clone https://git.bioconductor.org/packages/facsDorit
    git clone https://git.bioconductor.org/packages/metagenomeFeatures
    git clone https://git.bioconductor.org/packages/RDAVIDWebService

Then within R, in the same `$VERSIONDIR/external` directory,

    install.packages(c('DESeq','prada','PGSEA','rTANDEM','FunciSNP.data','Roleswitch','facsDorit','FunciSNP','metagenomeFeatures','RDAVIDWebService'), repos=NULL)

Once these are installed, many others can be installed.  Another round of `source('inst1.R')` followed by `./installed.R -c` gives us:

    The R_packages/4.3.1 omnibus module for R version 4.3.1 (2023-06-16) and BioConductor version 3.17

    A total of 23426 R packages are installed
    A total of 23490 packages are available in CRAN and BioConductor
    19817 CRAN packages are installed, out of 19931 available
    3544 BioConductor-specific packages are installed, out of 3559 available
    63 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere


### lme4qtl, harmony, LDna, ampvis2, CaSpER, loomR, SeuratDisk, SeuratWrappers, kBET, presto, ArchR, sgi, ASCAT, ggnet, STAAR, cblindplot

Github-hosted packages.  Make sure hdf5/1.14.0 is loaded, loomR uses it.

    devtools::install_github("stefpeschel/NetCoMi", dependencies=TRUE, upgrade='never')
    devtools::install_github("variani/lme4qtl", ref='master', upgrade='never')
    devtools::install_github("immunogenomics/harmony", ref = 'master', upgrade='never')
    devtools::install_github("petrikemppainen/LDna", ref = 'master', upgrade='never')
    devtools::install_github("madsalbertsen/ampvis2", upgrade='never')
    devtools::install_github("akdess/CaSpER", upgrade='never')
    devtools::install_github("mojaveazure/loomR", ref = "develop", upgrade='never')
    devtools::install_github("mojaveazure/seurat-disk", upgrade='never')
    remotes::install_github("satijalab/seurat-wrappers", upgrade='never')
    devtools::install_github('theislab/kBET', upgrade='never')
    devtools::install_github('immunogenomics/presto', upgrade='never')
    devtools::install_github("GreenleafLab/ArchR", ref="master", upgrade='never')
    devtools::install_github(repo="krumsieklab/sgi", subdir="sgi", upgrade='never')
    devtools::install_github('VanLoo-lab/ascat/ASCAT', upgrade='never')
    devtools::install_github("briatte/ggnet", upgrade='never')
    devtools::install_github("ducciorocchini/cblindplot", upgrade='never')
    devtools::install_github("RoseString/SCOPfunctions", upgrade='never')
    devtools::install_github("McGranahanLab/TcellExTRECT", upgrade='never')
    remotes::install_github('satijalab/azimuth', ref = 'master', upgrade='never')
    devtools::install_github('WSpiller/MVMR', upgrade='never')
    devtools::install_github("danro9685/CIMLR", ref="R", upgrade='never')
    devtools::install_gitlab('CarlBrunius/MUVR', upgrade='never')
    devtools::install_github('xuranw/MuSiC', upgrade='never')
    devtools::install_github('cole-trapnell-lab/monocle3', dependencies=TRUE, upgrade='never')
    devtools::install_github('SGDDNB/ShinyCell', upgrade="never", force=TRUE, build_vignettes=TRUE)
    devtools::install_github("chris-mcginnis-ucsf/DoubletFinder", upgrade='never', build_vignettes=TRUE)


STAAR and its tutorials work with several other packages not provided with CRAN or BioConductor.

    devtools::install_github("xihaoli/STAAR", upgrade='never')
    devtools::install_github("zilinli1988/SCANG", upgrade='never')
    devtools::install_github("xihaoli/STAARpipeline",ref="main", upgrade='never')
    devtools::install_github("xihaoli/STAARpipelineSummary",ref="main", upgrade='never')

HDL installs from a subdirectory of its repository.

    devtools::install_github(repo="zhenin/HDL", subdir="HDL", upgrade='never')

### BPCells

This appears not to require an older hdf5, so just leave hdf5/1.14.0 loaded.

No update since last download, v0.1.0 is still the latest tagged version.

    cd $VERSIONDIR/external
    wget https://github.com/bnprks/BPCells/archive/refs/tags/v0.1.0.tar.gz
    tar xf v0.1.0.tar.gz

Edit its configure to pull from HDF5_LIB and HDF5_INCLUDE, and to remove the
use of `-march=native` which will, when built on rackham, fail on snowy.

    vim BPCells-0.1.0/configure

A diff of the old and new configure is:

  Old                                    New

24  HDF5_CFLAGS=""                       HDF5_CFLAGS="-I${HDF5_INCLUDE}"
25  HDF5_LIBS="-lhdf5"                   HDF5_LIBS="-L${HDF5_LIB} -lhdf5"

75  echo "ARCH_FLAG='$ARCH_FLAG'"        echo "ARCH_FLAG='$ARCH_FLAG'"
76                                       ARCH_FLAG=''
77                                       echo "ARCH_FLAG='$ARCH_FLAG'"


Now within R:

    install.packages('BPCells-0.1.0', repos=NULL)
    q()

Unload the hdf5 module and make sure the BPCells.so library can find it:

    module unload hdf5/1.14.0
    ldd /sw/apps/R_packages/4.3.1/rackham/BPCells/libs/BPCells.so

If so it worked correctly, so load the newer one:

    module load hdf5/1.14.0



### HDL

We install this from its subdirectory above.  The repository also contains some
scripts and datasets that the users may wish to use.  Added a note to the
module help, and defined the new mf file variable `reposroot` to point to
`$VERSIONDIR/external`.


### velocyto.R

This has not been updated, so follow the same procedure.

I forked the https://github.com/velocyto-team/velocyto.R repository to
https://github.com/douglasgscofield/velocyto.R to enable building off
`BOOST_ROOT` and there have been no further changes to the original repository
at least since R_packages/4.0.0. Build with newer toolchain here.  This needs
`hdf5r` installed, see above.

Outside R, load the boost module compatible with the version of gcc used to build R:

    module load boost/1.83.0-gcc12.3.0

Then inside R:

    devtools::install_github("douglasgscofield/velocyto.R")

And verify outside R:

    module unload boost
    ldd /sw/apps/R_packages/4.3.1/rackham/velocyto.R/libs/velocyto.R.so


### igraph0, CoxBoost, rrbgen, STITCH, EasyQC, EasyQC2, contamMix, LRAcluster, compoisson, phylosim

Also, install an outdated package `igraph0`, which has been superseded by
`igraph` (installed above) but needed by some older procedures.

    cd /sw/apps/R_packages/external_tarballs

    R CMD INSTALL igraph0_0.5.7.tar.gz
    R CMD INSTALL CoxBoost_1.4.tar.gz
    R CMD INSTALL rrbgen_0.0.6.tar.gz
    R CMD INSTALL STITCH_1.6.8.tar.gz
    R CMD INSTALL EasyQC_23.8.tar.gz
    R CMD INSTALL EasyQC2_1.1.1.tar.gz
    R CMD INSTALL contamMix_1.0-10.tar.gz
    R CMD INSTALL LRAcluster_1.0.tgz

    wget https://cran.r-project.org/src/contrib/Archive/compoisson/compoisson_0.3.tar.gz
    R CMD INSTALL compoisson_0.3.tar.gz
    wget https://cran.r-project.org/src/contrib/Archive/phylosim/phylosim_3.0.5.tar.gz
    R CMD INSTALL phylosim_3.0.5.tar.gz


### dnase2tf

Added the module dnase2tf from the source under source tree directory for
calcDFT/1.0.1.  No update since 1.0.1.

Inside R:

    install.packages('/sw/bioinfo/calcDFT/1.0.1/src/dnase2tf', repos=NULL, type="source")



### SAIGE

**NOTE** SAIGE is now installed in its own module, SAIGE/0.42.1 on its first installation.


### MDInstruments, MRPracticals, TwoSampleMR

Install github-hosted packages MDInstruments and MRPracticals.  Download the
latest releases from <https://github.com/MRCIEU/MRInstruments/releases> and
<https://github.com/WSpiller/MRPracticals>.  Note that MRPracticals does not
have regular releases, and they also require another github-hosted package
called TwoSampleMR.  So, we do the above to set up our R environment and do all
this inside R:
  

    devtools::install_github("MRCIEU/TwoSampleMR", upgrade='never')
    devtools::install_github("MRCIEU/MRInstruments", upgrade='never')

MRPracticals does not install because if its vignettes. Create a tarball separately and install from that.

    cd $VERSIONDIR/external
    git clone https://github.com/WSpiller/MRPracticals
    module load pandoc/3.1.3  # regresses texlive version
    module load texlive/2023-08-14  # restore it, pandoc won't care
    cd MRPracticals
    R

and within R,

    tools::buildVignettes(dir = '.', tangle = TRUE)
    devtools::build('.')

This builds the now-vignette-containing `MRPracticals_0.0.1.tar.gz` in the parent directory.
Then, exit R, cd to the parent directory, which is `$VERSIONDIR/external`, and
install from the tarball.

    cd ..
    R CMD INSTALL MRPracticals_0.0.1.tar.gz


### arrow

arrow is installed as a normal R package. Do the following check within R

    library(arrow)
    packageVersion('arrow')
    codec_is_available('lz4')
    codec_is_available('zstd')

If either of the codec statements is FALSE (both were TRUE this time), then
reinstall using the following to build arrow with LZ4 and ZSTD and other
features.  What is filled in for ARROWVERSION is what is printed by the
packageVersion() command within R.

    cd $VERSIONROOT/external
    ARROWVERSION=13.0.0.1
    wget https://cran.r-project.org/src/contrib/arrow_${ARROWVERSION}.tar.gz
    export LIBARROW_MINIMAL=false
    ARROW_WITH_ZLIB=ON ARROW_WITH_ZSTD=ON ARROW_WITH_LZ4=ON ARROW_WITH_BZ2=ON ARROW_R_DEV=true R CMD INSTALL arrow_${ARROWVERSION}.tar.gz



### CrIMMix


CrIMMix cannot be installed for 4.3.1 nor 4.2.1.

    devtools::install_github("CNRGH/crimmix", upgrade='never')

    Error: object 'sgcca' is not exported by 'namespace:RGCCA'
    Execution halted
    ERROR: lazy loading failed for package 'CrIMMix'
    * removing '/sw/apps/R_packages/4.3.1/rackham/CrIMMix'

Same error with 4.3.1.



Final run
---------

    source('inst1.R')

The outside R, in $VERSIONDIR (as of 2023-10-11):

    ./installed.R -c

    The R_packages/4.3.1 omnibus module for R version 4.3.1 (2023-06-16) and BioConductor version 3.17

    A total of 23476 R packages are installed
    A total of 23535 packages are available in CRAN and BioConductor
    19809 CRAN packages are installed, out of 19976 available
    3544 BioConductor-specific packages are installed, out of 3559 available
    121 other R packages are installed. These are not in CRAN/BioConductor, are only available in the CRAN/BioConductor archives, or are hosted on github, gitlab or elsewhere


Adding a new package
--------------------

Setup.

    cd /sw/apps/R_packages/4.3.1
    source source-for-setup
    chmod u+w rackham

Within R, for both CRAN and BioConductor packages, we use
`BiocManager::install(update=FALSE)` which ultimately uses R's own
`install.packages()`.


    new.packages = c('package_a')
    if (! requireNamespace("BiocManager"))
        install.packages("BiocManager")
    BiocManager::install(new.packages, update=FALSE, Ncpus=10)
    BiocManager::install(new.packages, update=FALSE, Ncpus=10)

This will fail if it wants to update packages, as they will still be
write-protected. Ideally, this would not update packages, we want to
fix on the installed versions here.

Quit R, and relock the entire tree to cover any new installations
as a result of the above.

    chmod -R -w rackham


After adding new packages
-------------------------

Get a count of installed packages, and a list of installed packages.

    cd $VERSIONDIR
    ./installed.R -c | tee counts.txt
    ./installed.R -t > table.txt
    ../create_html_table.pl table.txt > table.html

Add this to the appropriate section of <http://www.uppmax.uu.se/support/user-guides/r_packages-module-guide/>

We always need to write-protect this module, as well as the corresponding R module.



Note about the mf file
----------------------

Though this build procedure sets `R_LIBS_USER` to ease installing R packages,
the mf file for the module sets `R_LIBS_SITE`, not `R_LIBS_USER`.  This is so
users can freely use `R_LIBS_USER` to refer to their own or project-specific R
package trees without fearing conflicting with this module.

