deal.II/8.4.2
=============

Open source finite element library.

<https://www.dealii.org/>

Build from source.  Tried several things, this finally worked.

LOG
---


    TOOL=deal.II
    VERSION=8.4.2
    cd /sw/libs
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == snowy ]] && for CL in irma bianca ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    module load git/2.21.0
    git clone https://github.com/koecher/candi
    cd candi

Now edit `candi.cfg` to install deal.II version `v8.4.2`.  The edited diff of
the original `candi.cfg` and the edited one is:

      # Install the following deal.II version:
      -DEAL_II_VERSION=v9.0.1
      +DEAL_II_VERSION=v8.4.2

Load the appropriate gcc and openmpi modules.  I tried building with gcc/9.2.0
and openmpi/4.0.2 on rackham, but ended up with a configuration error in the
PETsc library.  There may have been a way around that, but I backed up to older
versions and everything worked fine.  This gcc+openmpi combination is available
on snowy as well.

    module load gcc/6.3.0
    module load openmpi/2.1.0

Now, set `CC`, etc. for the MPI compilation and verify it works.

    export CC=mpicc; export CXX=mpicxx; export FC=mpif90; export FF=mpif77
    which $CC

You should see something like `/opt/openmpi/2.1.0gcc6.3.0/bin/mpicc`.

Now build using the `platforms/supported/centos7.platform` platform, installing
to `$PREFIX`.

    ./candi.sh -j 30 --prefix=$PREFIX --platform=deal.II-toolchain/platforms/supported/centos7.platform


When the build completes, it will end with something like


    dealii.git has now been installed in

        /sw/libs/deal.II/8.4.2/rackham/deal.II-v8.4.2

    To update your environment variables, use the created modulefile:

        /sw/libs/deal.II/8.4.2/rackham/configuration/modulefiles/default

    If you are not using modules, execute the following command instead:

        source /sw/libs/deal.II/8.4.2/rackham/configuration/deal.II-v8.4.2

    To export environment variables for all installed libraries execute:

        source /sw/libs/deal.II/8.4.2/rackham/configuration/enable.sh

    Build finished in 3413 seconds.

    Summary of timings:

    dealii-prepare: 0 s
    opencascade: 850 s
    parmetis: 76 s
    hdf5: 154 s
    p4est: 84 s
    trilinos: 984 s
    petsc: 600 s
    slepc: 28 s
    dealii: 628 s


The library, include files and other stuff for deal.II are found under
`$PREFIX/deal.II-v8.4.2/` Double-check that RPATH info is correct... checking
with ldd *with no other modules loaded* should result in something like

    cd $PREFIX/deal.II-v8.4.2
    ldd libdeal_II.g.so.8.4.2

            linux-vdso.so.1 =>  (0x00007fff44df2000)
            libp4est-2.0.so => /sw/libs/deal.II/8.4.2/rackham/p4est-2.0/DEBUG/lib/libp4est-2.0.so (0x00002abbb851a000)
            libsc-2.0.so => /sw/libs/deal.II/8.4.2/rackham/p4est-2.0/DEBUG/lib/libsc-2.0.so (0x00002abbb8849000)
            libtbb.so.2 => /lib64/libtbb.so.2 (0x00002abbb8a84000)
            libz.so.1 => /lib64/libz.so.1 (0x00002abbb8cb9000)
            libmuelu-adapters.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libmuelu-adapters.so.12 (0x00002abbb8ecf000)
            libmuelu-interface.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libmuelu-interface.so.12 (0x00002abbb930b000)
            libmuelu.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libmuelu.so.12 (0x00002abbb9913000)
            libml.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libml.so.12 (0x00002abbba9e6000)
            libifpack.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libifpack.so.12 (0x00002abbbaef3000)
            libamesos.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libamesos.so.12 (0x00002abbbb2ec000)
            libaztecoo.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libaztecoo.so.12 (0x00002abbbb567000)
            libxpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libxpetra.so.12 (0x00002abbbb7f3000)
            libepetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libepetra.so.12 (0x00002abbbba8f000)
            libteuchoscomm.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchoscomm.so.12 (0x00002abbbbdf4000)
            libteuchosparameterlist.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchosparameterlist.so.12 (0x00002abbbc0d1000)
            libteuchoscore.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchoscore.so.12 (0x00002abbbc6e2000)
            libmetis.so => /sw/libs/deal.II/8.4.2/rackham/parmetis-4.0.3/lib/libmetis.so (0x00002abbbc93d000)
            libhdf5.so.101 => /sw/libs/deal.II/8.4.2/rackham/hdf5-1.10.1/lib/libhdf5.so.101 (0x00002abbbcbac000)
            libnetcdf_c++.so.4 => /lib64/libnetcdf_c++.so.4 (0x00002abbbd192000)
            libTKBool.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKBool.so.11 (0x00002abbbd3b0000)
            libTKBRep.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKBRep.so.11 (0x00002abbbd900000)
            libTKernel.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKernel.so.11 (0x00002abbbdbca000)
            libTKG3d.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKG3d.so.11 (0x00002abbbdfdd000)
            libTKGeomAlgo.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKGeomAlgo.so.11 (0x00002abbbe2ec000)
            libTKGeomBase.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKGeomBase.so.11 (0x00002abbbea06000)
            libTKIGES.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKIGES.so.11 (0x00002abbbf0bb000)
            libTKMath.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKMath.so.11 (0x00002abbbf646000)
            libTKShHealing.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKShHealing.so.11 (0x00002abbbfab3000)
            libTKSTEP.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKSTEP.so.11 (0x00002abbbfed5000)
            libTKTopAlgo.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKTopAlgo.so.11 (0x00002abbc0335000)
            libTKXSBase.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKXSBase.so.11 (0x00002abbc0799000)
            liblapack.so.3 => /lib64/liblapack.so.3 (0x00002abbc0bde000)
            libblas.so.3 => /lib64/libblas.so.3 (0x00002abbc133b000)
            libmpi.so.20 => /opt/openmpi/2.1.0gcc6.3.0/lib/libmpi.so.20 (0x00002abbc1594000)
            libpthread.so.0 => /lib64/libpthread.so.0 (0x00002abbc188d000)
            libslepc.so.3.7 => /sw/libs/deal.II/8.4.2/rackham/slepc-3.7.3/lib/libslepc.so.3.7 (0x00002abbc1aa9000)
            libpetsc.so.3.7 => /sw/libs/deal.II/8.4.2/rackham/petsc-3.7.6/lib/libpetsc.so.3.7 (0x00002abbc1eed000)
            libstdc++.so.6 => /sw/comp/gcc/6.3.0_snowy/lib64/libstdc++.so.6 (0x00002abbc32cc000)
            libm.so.6 => /lib64/libm.so.6 (0x00002abbc364d000)
            libc.so.6 => /lib64/libc.so.6 (0x00002abbc394f000)
            libgcc_s.so.1 => /sw/comp/gcc/6.3.0_snowy/lib64/libgcc_s.so.1 (0x00002abbc3d1d000)
            libgomp.so.1 => /sw/comp/gcc/6.3.0_snowy/lib64/libgomp.so.1 (0x00002abbc3f34000)
            liblua-5.1.so => /lib64/liblua-5.1.so (0x00002abbc4161000)
            libdl.so.2 => /lib64/libdl.so.2 (0x00002abbc438f000)
            librt.so.1 => /lib64/librt.so.1 (0x00002abbc4593000)
            libteko.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteko.so.12 (0x00002abbc479b000)
            libanasazitpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libanasazitpetra.so.12 (0x00002abbc4d13000)
            libModeLaplace.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libModeLaplace.so.12 (0x00002abbc4f1a000)
            libanasaziepetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libanasaziepetra.so.12 (0x00002abbc5155000)
            libanasazi.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libanasazi.so.12 (0x00002abbc5376000)
            libstratimikos.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikos.so.12 (0x00002abbc5579000)
            libstratimikosbelos.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikosbelos.so.12 (0x00002abbc57a9000)
            libstratimikosaztecoo.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikosaztecoo.so.12 (0x00002abbc5ce8000)
            libstratimikosamesos.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikosamesos.so.12 (0x00002abbc5f47000)
            libstratimikosml.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikosml.so.12 (0x00002abbc617f000)
            libstratimikosifpack.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libstratimikosifpack.so.12 (0x00002abbc63af000)
            libifpack2-adapters.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libifpack2-adapters.so.12 (0x00002abbc65e1000)
            libifpack2.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libifpack2.so.12 (0x00002abbc6865000)
            libbelostpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libbelostpetra.so.12 (0x00002abbc6eaf000)
            libbelosepetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libbelosepetra.so.12 (0x00002abbc7498000)
            libbelos.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libbelos.so.12 (0x00002abbc78a3000)
            libamesos2.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libamesos2.so.12 (0x00002abbc7aac000)
            libgaleri-xpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libgaleri-xpetra.so.12 (0x00002abbc7d7d000)
            libgaleri-epetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libgaleri-epetra.so.12 (0x00002abbc7f80000)
            libzoltan2.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libzoltan2.so.12 (0x00002abbc81c1000)
            libisorropia.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libisorropia.so.12 (0x00002abbc842f000)
            libxpetra-sup.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libxpetra-sup.so.12 (0x00002abbc86a7000)
            libthyratpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libthyratpetra.so.12 (0x00002abbc8950000)
            libthyraepetraext.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libthyraepetraext.so.12 (0x00002abbc8b71000)
            libthyraepetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libthyraepetra.so.12 (0x00002abbc8de2000)
            libthyracore.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libthyracore.so.12 (0x00002abbc905a000)
            librtop.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/librtop.so.12 (0x00002abbc9ae3000)
            libepetraext.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libepetraext.so.12 (0x00002abbc9d6e000)
            libtriutils.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtriutils.so.12 (0x00002abbca0c1000)
            libtpetraext.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetraext.so.12 (0x00002abbca312000)
            libtpetrainout.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetrainout.so.12 (0x00002abbca5c1000)
            libtpetra.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetra.so.12 (0x00002abbca7f6000)
            libkokkostsqr.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libkokkostsqr.so.12 (0x00002abbcb1ff000)
            libtpetrakernels.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetrakernels.so.12 (0x00002abbcb457000)
            libkokkosalgorithms.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libkokkosalgorithms.so.12 (0x00002abbcb87f000)
            libtpetraclassiclinalg.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetraclassiclinalg.so.12 (0x00002abbcba81000)
            libtpetraclassicnodeapi.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetraclassicnodeapi.so.12 (0x00002abbcbc83000)
            libtpetraclassic.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libtpetraclassic.so.12 (0x00002abbcbe8e000)
            libzoltan.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libzoltan.so.12 (0x00002abbcc090000)
            libparmetis.so => /sw/libs/deal.II/8.4.2/rackham/parmetis-4.0.3/lib/libparmetis.so (0x00002abbcc397000)
            libteuchoskokkoscomm.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchoskokkoscomm.so.12 (0x00002abbcc5d9000)
            libteuchoskokkoscompat.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchoskokkoscompat.so.12 (0x00002abbcc7db000)
            libteuchosremainder.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchosremainder.so.12 (0x00002abbcc9e8000)
            libteuchosnumerics.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libteuchosnumerics.so.12 (0x00002abbccbef000)
            libkokkoscontainers.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libkokkoscontainers.so.12 (0x00002abbcce14000)
            libkokkoscore.so.12 => /sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib/libkokkoscore.so.12 (0x00002abbcd016000)
            libmpi_usempif08.so.20 => /opt/openmpi/2.1.0gcc6.3.0/lib/libmpi_usempif08.so.20 (0x00002abbcd269000)
            libmpi_usempi_ignore_tkr.so.20 => /opt/openmpi/2.1.0gcc6.3.0/lib/libmpi_usempi_ignore_tkr.so.20 (0x00002abbcd499000)
            libmpi_mpifh.so.20 => /opt/openmpi/2.1.0gcc6.3.0/lib/libmpi_mpifh.so.20 (0x00002abbcd6a0000)
            libgfortran.so.3 => /sw/comp/gcc/6.3.0_snowy/lib64/libgfortran.so.3 (0x00002abbcd8f5000)
            libquadmath.so.0 => /sw/comp/gcc/6.3.0_snowy/lib64/libquadmath.so.0 (0x00002abbcdc1b000)
            /lib64/ld-linux-x86-64.so.2 (0x00002abbaf53b000)
            libnetcdf.so.7 => /lib64/libnetcdf.so.7 (0x00002abbcde5a000)
            libTKPrim.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKPrim.so.11 (0x00002abbd124b000)
            libTKG2d.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKG2d.so.11 (0x00002abbd1497000)
            libTKBO.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKBO.so.11 (0x00002abbd1709000)
            libTKOffset.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKOffset.so.11 (0x00002abbd1ac6000)
            libTKFillet.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKFillet.so.11 (0x00002abbd1dd0000)
            libTKSTEPAttr.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKSTEPAttr.so.11 (0x00002abbd2260000)
            libTKSTEP209.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKSTEP209.so.11 (0x00002abbd24fd000)
            libTKSTEPBase.so.11 => /sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib/libTKSTEPBase.so.11 (0x00002abbd27b3000)
            libopen-rte.so.20 => /sw/parallel/openmpi/snowy-centos7/2.1.0gcc6.3.0/lib/libopen-rte.so.20 (0x00002abbd2c0e000)
            libopen-pal.so.20 => /sw/parallel/openmpi/snowy-centos7/2.1.0gcc6.3.0/lib/libopen-pal.so.20 (0x00002abbd2e90000)
            libnuma.so.1 => /lib64/libnuma.so.1 (0x00002abbd3185000)
            libudev.so.1 => /lib64/libudev.so.1 (0x00002abbd3390000)
            libutil.so.1 => /lib64/libutil.so.1 (0x00002abbd35a6000)
            libhwloc.so.5 => /lib64/libhwloc.so.5 (0x00002abbd37a9000)
            libssl.so.10 => /lib64/libssl.so.10 (0x00002abbd39e6000)
            libcrypto.so.10 => /lib64/libcrypto.so.10 (0x00002abbd3c58000)
            libhdf5_hl.so.8 => /lib64/libhdf5_hl.so.8 (0x00002abbd40bb000)
            libhdf5.so.8 => /lib64/libhdf5.so.8 (0x00002abbd42ef000)
            libcurl.so.4 => /lib64/libcurl.so.4 (0x00002abbd48e5000)
            libjpeg.so.62 => /lib64/libjpeg.so.62 (0x00002abbd4b4f000)
            libcap.so.2 => /lib64/libcap.so.2 (0x00002abbd4da4000)
            libdw.so.1 => /lib64/libdw.so.1 (0x00002abbd4fa9000)
            libltdl.so.7 => /lib64/libltdl.so.7 (0x00002abbd51fa000)
            libgssapi_krb5.so.2 => /lib64/libgssapi_krb5.so.2 (0x00002abbd5404000)
            libkrb5.so.3 => /lib64/libkrb5.so.3 (0x00002abbd5651000)
            libcom_err.so.2 => /lib64/libcom_err.so.2 (0x00002abbd593a000)
            libk5crypto.so.3 => /lib64/libk5crypto.so.3 (0x00002abbd5b3e000)
            libsz.so.2 => /lib64/libsz.so.2 (0x00002abbd5d71000)
            libidn.so.11 => /lib64/libidn.so.11 (0x00002abbd5f74000)
            libssh2.so.1 => /lib64/libssh2.so.1 (0x00002abbd61a7000)
            libssl3.so => /lib64/libssl3.so (0x00002abbd63d4000)
            libsmime3.so => /lib64/libsmime3.so (0x00002abbd662d000)
            libnss3.so => /lib64/libnss3.so (0x00002abbd6855000)
            libnssutil3.so => /lib64/libnssutil3.so (0x00002abbd6b84000)
            libplds4.so => /lib64/libplds4.so (0x00002abbd6db4000)
            libplc4.so => /lib64/libplc4.so (0x00002abbd6fb8000)
            libnspr4.so => /lib64/libnspr4.so (0x00002abbd71bd000)
            liblber-2.4.so.2 => /lib64/liblber-2.4.so.2 (0x00002abbd73fb000)
            libldap-2.4.so.2 => /lib64/libldap-2.4.so.2 (0x00002abbd760a000)
            libattr.so.1 => /lib64/libattr.so.1 (0x00002abbd785f000)
            libelf.so.1 => /lib64/libelf.so.1 (0x00002abbd7a64000)
            liblzma.so.5 => /lib64/liblzma.so.5 (0x00002abbd7c7c000)
            libbz2.so.1 => /lib64/libbz2.so.1 (0x00002abbd7ea2000)
            libkrb5support.so.0 => /lib64/libkrb5support.so.0 (0x00002abbd80b2000)
            libkeyutils.so.1 => /lib64/libkeyutils.so.1 (0x00002abbd82c2000)
            libresolv.so.2 => /lib64/libresolv.so.2 (0x00002abbd84c6000)
            libaec.so.0 => /lib64/libaec.so.0 (0x00002abbd86df000)
            libsasl2.so.3 => /lib64/libsasl2.so.3 (0x00002abbd88e7000)
            libselinux.so.1 => /lib64/libselinux.so.1 (0x00002abbd8b04000)
            libcrypt.so.1 => /lib64/libcrypt.so.1 (0x00002abbd8d2b000)
            libpcre.so.1 => /lib64/libpcre.so.1 (0x00002abbd8f62000)
            libfreebl3.so => /lib64/libfreebl3.so (0x00002abbd91c4000)

and the patchelf results are

    ( module load patchelf; patchelf --print-rpath libdeal_II.g.so.8.4.2 )
    /sw/parallel/openmpi/rackham-centos7/2.1.0gcc6.3.0/lib:/sw/libs/deal.II/8.4.2/rackham/p4est-2.0/DEBUG/lib:/sw/libs/deal.II/8.4.2/rackham/trilinos-release-12-10-1/lib:/sw/libs/deal.II/8.4.2/rackham/parmetis-4.0.3/lib:/sw/libs/deal.II/8.4.2/rackham/hdf5-1.10.1/lib:/sw/libs/deal.II/8.4.2/rackham/oce-OCE-0.18.2/lib:/sw/libs/deal.II/8.4.2/rackham/slepc-3.7.3/lib:/sw/libs/deal.II/8.4.2/rackham/petsc-3.7.6/lib


To link against this library, the mf file must include the correct paths for the library etc.


prepend-path CPATH                  /sw/libs/deal.II/8.4.2/rackham/deal.II-v8.4.2/include
prepend-path CPLUS_INCLUDE_PATH     /sw/libs/deal.II/8.4.2/rackham/deal.II-v8.4.2/include
prepend-path LD_RUN_PATH            /sw/libs/deal.II/8.4.2/rackham/deal.II-v8.4.2/lib
prepend-path LD_LIBRARY_PATH        /sw/libs/deal.II/8.4.2/rackham/deal.II-v8.4.2/lib
setenv       CC                     mpicc
setenv       CXX                    mpixxc
setenv       FC                     mpif90
setenv       FF                     mpif77

Do we include the other directories for the other prereqs built along with this?
