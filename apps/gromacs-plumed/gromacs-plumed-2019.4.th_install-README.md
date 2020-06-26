gromacs-plumed/2019.4.th
========================

<http://www.gromacs.org/>

Used under license:


Structure creating script (makeroom_gromacs-plumed_2019.4.th.sh) moved to /sw/apps/gromacs-plumed/makeroom_2019.4.th.sh

LOG
---

    TOOL=gromacs-plumed
    VERSION=2019.4.th
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/gromacs-plumed/2019.4.th/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "gromacs-plumed" -v "2019.4.th" -c "apps" -w "http://www.gromacs.org/" -u "rackham"
    ./makeroom_gromacs-plumed_2019.4.th.sh
    cd /sw/apps/gromacs-plumed/2019.4.th/rackham_build/

    wget http://ftp.gromacs.org/pub/gromacs/gromacs-2019.4.tar.gz
    tar -xvf gromacs-2019.4.tar.gz
    cd gromacs-2019.4

    module load intel/18.3
    module load  intelmpi/18.3
    module load cmake/3.7.2

    #module load plumed/2.6.0
    source /sw/libs/plumed/2.6.0/src/plumed-2.6.0/sourceme.sh

    plumed patch -p

    mkdir build_th
    cd build_th

    cmake ../ -DCMAKE_INSTALL_PREFIX=/sw/apps/gromacs-plumed/2019.4.th/rackham -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_PREFER_STATIC_LIBS=ON -DCMAKE_BUILD_TYPE=RELEASE
     
    make install
      
    cd ..
    mkdir build_th_seq
    cd build_th_seq
    cmake ../ -DCMAKE_INSTALL_PREFIX=/sw/apps/gromacs-plumed/2019.4.th/rackham -DGMX_GPU=OFF -DGMX_THREAD_MPI=ON -DGMX_OPENMP=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_PREFER_STATIC_LIBS=ON -DCMAKE_BUILD_TYPE=RELEASE
       
    make install
    
