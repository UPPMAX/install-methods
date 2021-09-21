cp2k/8.1-gcc
========================

<https://www.cp2k.org/>

Used under license:
GPL


Structure creating script (makeroom_cp2k_8.1-gcc.sh) moved to /sw/apps/cp2k/makeroom_8.1-gcc.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh -t "cp2k" -v "8.1-gcc" -w "https://www.cp2k.org/" -c "apps" -l "GPL" -d "CP2K is a quantum chemistry and solid state physics software package that can perform atomistic simulations of solid state\, liquid\, molecular\, periodic\, material\, crystal\, and biological systems." -u "rackham" -f"
    ./makeroom_cp2k_8.1-gcc.sh
    source /sw/apps/cp2k/SOURCEME_cp2k_8.1-gcc && cd $TOOLDIR/$VERSION
    wget https://github.com/cp2k/cp2k/releases/download/v8.1.0/cp2k-8.1.tar.bz2
    mkdir src-rackham
    tar xvf cp2k-8.1.tar.bz2 -C src-rackham
    cd src-rackham/cp2k-8.1/tools/toolchain

    module load gcc/7.3.0
    module load openmpi/3.1.0
    module load python/3.9.5

    ./install_cp2k_toolchain.sh

==================== generating arch files ====================
arch files can be found in the /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch subdirectory
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local.ssmp
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local.sdbg
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local.psmp
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local.pdbg
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local_warn.psmp
Wrote /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/local_coverage.pdbg
========================== usage =========================
Done!
Now copy:
  cp /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/* to the cp2k/arch/ directory
To use the installed tools and libraries and cp2k version
compiled with it you will first need to execute at the prompt:
  source /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/setup
To build CP2K you should change directory:
  cd cp2k/
  make -j 20 ARCH=local VERSION="ssmp sdbg psmp pdbg"

arch files for GPU enabled CUDA versions are named "local_cuda.*"
arch files for valgrind versions are named "local_valgrind.*"
arch files for coverage versions are named "local_coverage.*"

Note that these pre-built arch files are for the GNU compiler, users have to adapt them for other compilers.
It is possible to use the provided CP2K arch files as guidance.

    cp /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/arch/*  $TOOLDIR/$VERSION/src-rackham/cp2k-8.1/arch
    cd $TOOLDIR/$VERSION/src-rackham/cp2k-8.1
    source /sw/apps/cp2k/8.1-gcc/src-rackham/cp2k-8.1/tools/toolchain/install/setup
    make -j 20 ARCH=local VERSION="ssmp psmp"
    make -j 20 ARCH=local VERSION="ssmp psmp" libcp2k



