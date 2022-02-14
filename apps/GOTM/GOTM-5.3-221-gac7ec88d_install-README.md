GOTM/5.3-212-g6944e393
======================

LOG
---

    cd /sw/apps/GOTM
    cd 5.3-212-g6944e393/
    cd src/
    cd code/
    module use /sw/EasyBuild/modules/all
    ml intel/2018b
    ml HDF5/1.10.2-intel-2018b
    ml netCDF/4.6.1-intel-2018b
    cd 5.3-212-g6944e393/
    git submodule update --init --recursive
    ml CMake/3.12.1-GCCcore-7.3.0
    module load netCDF-Fortran/4.4.4-intel-2018b
    cd code/
    mkdir build
    cd build
    CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
    make -j10
    make install
    cd $PREFIX/bin
    ldd gotm
