lammps/29Oct2020_gcc_openmpi
========================

<https://lammps.sandia.gov/>

Used under license:
GPLv2
<https://github.com/lammps/lammps/blob/master/LICENSE>

Structure creating script (makeroom_lammps_29Oct2020_gcc_openmpi.sh) moved to /sw/apps/lammps/makeroom_29Oct2020_gcc_openmpi.sh

LOG
---

    TOOL=lammps
    VERSION=29Oct2020_gcc_openmpi
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/lammps/29Oct2020_gcc_openmpi/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "lammps" -v "29Oct2020_gcc_openmpi" -c "apps" -w "https://lammps.sandia.gov/" -l "GPLv2" -L "https://github.com/lammps/lammps/blob/master/LICENSE" -d "LAMMPS stands for Large-scale Atomic/Molecular Massively Parallel" -f"
    ./makeroom_lammps_29Oct2020_gcc_openmpi.sh
    cd $SRCDIR
    tar xvf lammps-29Oct20.tar.gz
    cd lammps-29Oct20/src
    
    module load gcc/6.3.0
    module load openmpi/2.1.0
    
    make yes-asphere
    make yes-asphere
    make yes-body
    make yes-class2
    make yes-colloid
    make yes-coreshell
    make yes-dipole
    make yes-granular
    make yes-kspace
    make yes-manybody
    make yes-mc
    make yes-misc
    make yes-molecule
    make yes-mpiio
    make yes-opt
    make yes-peri
    make yes-qeq
    make yes-replica
    make yes-rigid
    make yes-shock
    make yes-snap
    make yes-srd
    make yes-user-cg-cmm
    make yes-user-diffraction
    make yes-user-dpd
    make yes-user-drude
    make yes-user-eff
    make yes-user-fep
    make yes-user-lb
    make yes-user-manifold
    make yes-user-mgpt
    make yes-user-misc
    make yes-user-phonon
    make yes-user-qtb
    make yes-user-reaxc
    make yes-user-smtbq
    make yes-user-sph
    make yes-user-tally

    make -j 20 mpi

    cd $PREFIX
    ln -s ../local-build/lammps-29Oct20/src/lmp_mpi

