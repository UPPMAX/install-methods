gdl/1.0.0-rc.1
==============

LOG
---

    cd /sw/apps
    mkdir gdl
    cd gdl
    VERSION=1.0.0-rc.1
    mkdir $VERSION
    cd $VERSION
    mkdir rackham
    PREFIX=$PWD/rackham
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do test -L $CL || ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://github.com/gnudatalanguage/gdl/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd gdl-${VERSION}/

    module load cmake/3.13.2
    module load gcc/6.3.0
    module load openmpi/2.1.0
    module load libharu/2.3.0
    module load hdf4/4.2.14-gcc6.3.0
    module load SHAPELIB/1.5.0
    module load szip/2.1.1
    module load python/3.7.2  # our default python installations include numpy scipy matplotlib
    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load wxWidgets/3.1.3-gtk3
    module load Eigen/3.3.4
    module load glpk/4.65
    module load zlib/1.2.11
    module load UDUNITS/2.2.26
    module load cairo/1.17.2
    module load PROJ.4/4.9.3
    module load ecCodes/2.13.1
    module load hdf5/1.10.5
    module load ImageMagick/6.9.9-35
    module load swig/3.0.7
    module load PLplot/5.15.0
    module load netcdf/4.7.1
    module load Qhull/2019.1
    module load libgeotiff/1.4.3
    module load pslib/0.4.6
    module load gsl/2.6
    module load libcurl/7.45.0

    mkdir build

    cmake .. -DBUILD_TEST=ON -DCMAKE_INSTALL_PREFIX=$PREFIX -DPLPLOTDIR=$PLPLOT_ROOT -DMAGICKDIR=$IMAGEMAGICK_ROOT -DGEOTIFFDIR=$LIBGEOTIFF_ROOT -DHDFDIR=$HDF4_ROOT -DNETCDFDIR=$NETCDF_ROOT -DEIGEN3DIR=$EIGEN_ROOT -DLIBPROJ4DIR=$PROJ4_ROOT -DPSLIBDIR=$PSLIB_ROOT -DSHAPELIBDIR=$SHAPELIB_ROOT -DUDUNITS:BOOL=ON -DUDUNITSDIR=$UDUNITS_ROOT -DGLPK:BOOL=ON -DGLPKDIR=$GLPK_ROOT -DGSLDIR=$GSL_ROOT -DGRIB:BOOL=ON -DZLIBDIR:PATH=$ZLIB_ROOT -DMPI:BOOL=OFF

    make -j30
    make install

There will be a message about conflicting versions of libhdf5.  We just live with it for now.

The RPATH information is woefully incomplete in the `gdl` executable.  Update it.  First, see what's missing.

    cd $PREFIX/bin
    module purge
    module load uppmax
    module load patchelf/0.10
    patchelf --print-rpath gdl

Doesn't seem like much is there.

    ldd gdl

Nope, lots is missing.  Keep what we have, and start adding.

    P="$(patchelf --print-rpath gdl)"

    P="$P:/sw/libs/gsl/2.6/rackham/lib"
    P="$P:/sw/apps/ImageMagick/6.9.9-35/rackham/lib"
    P="$P:/sw/libs/libgeotiff/1.4.3/rackham/lib"
    P="$P:/sw/libs/hdf4/4.2.14-gcc6.3.0/rackham/lib"
    P="$P:/sw/libs/szip/2.1.1/rackham/lib"
    P="$P:/sw/libs/PROJ.4/4.9.3/rackham/lib"
    P="$P:/sw/libs/UDUNITS/2.2.26/rackham/lib"
    P="$P:/sw/libs/pslib/0.4.6/rackham/lib"
    P="$P:/sw/libs/glpk/4.65/rackham/lib"
    P="$P:/sw/libs/SHAPELIB/1.5.0/rackham/lib"
    P="$P:/sw/comp/gcc/6.3.0_rackham/lib64"
    P="$P:/sw/libs/OpenJPEG/2.3.0/rackham/lib"
    P="$P:/sw/libs/cairo/1.17.2/rackham/lib"
    P="$P:/sw/libs/libcurl/7.45.0/rackham/lib"
    P="$P:/sw/libs/hdf5/1.10.5/rackham/lib"
    P="$P:/sw/libs/Qhull/2019.1/rackham/lib"
    P="$P:/sw/apps/xz/5.2.2/rackham/lib"
    P="$P:/sw/libs/libharu/2.3.0/rackham/lib"

    patchelf --set-rpath "$P" gdl

    ldd gdl

It's still not finding `libhpdf` and `libhdf5`, which we have info for, these
are libharu and the hdf5 module we had loaded.  It doesn't matter if these are
first or last in the RPATH.  If there is a size limitation on RPATH patchelf
doesn't tell us anything about this.  The only way around this is to add these
directories to LD_LIBRARY_PATH in the module load.  Then they are found by
`gdl`.

Remove unused directories.

    patchelf --shrink-rpath gdl 

and add these lines to the mf.

    prepend-path LD_LIBRARY_PATH /sw/libs/hdf5/1.10.5/rackham/lib
    prepend-path LD_LIBRARY_PATH /sw/libs/libharu/2.3.0/rackham/lib

We don't need to load any other modules, just add these directories.
