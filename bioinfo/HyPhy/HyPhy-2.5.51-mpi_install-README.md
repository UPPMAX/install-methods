HyPhy/2.5.51-mpi
========================

<http://www.hyphy.org>

Used under license:
Custom open-source 'as is'


Structure creating script (makeroom_HyPhy_2.5.51-mpi.sh) moved to /sw/bioinfo/HyPhy/makeroom_2.5.51-mpi.sh

LOG
---

    makeroom.sh "-t" "HyPhy" "-v" "2.5.51-mpi" "-w" "http://www.hyphy.org" "-s" "phylogeny" "-l" "Custom open-source 'as is'" "-d" "Open-source software package for the analysis of genetic sequences using techniques in phylogenetics, molecular evolution, and machine learning." "-f"
    ./makeroom_HyPhy_2.5.51-mpi.sh

    source /sw/bioinfo/HyPhy/SOURCEME_HyPhy_2.5.51 && cd $SRCDIR

    cd $VERSIONDIR
    rm -f snowy bianca
    mkdir snowy
    ln -sf snowy bianca

First build on rackham.  Remove existing unpack directory, download bundle if not available.

    cd $SRCDIR
    [[ -d hyphy-2.5.51hf ]] && rm -rf hyphy-2.5.51hf
    [[ -f ${VERSION}hf.tar.gz ]] || wget https://github.com/veg/hyphy/archive/${VERSION}hf.tar.gz
    tar xf ${VERSION}hf.tar.gz
    cd hyphy-${VERSION}hf

    # build in a subdirectory

    mkdir build_rackham
    cd build_rackham

    module load cmake/3.26.3
    module load gcc/11.3.0
    module load libcurl/7.85.0
    module load zstd/1.5.2
    module load zlib/1.2.12
    module load openmpi/4.1.2    
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCURL_INCLUDE_DIR:PATH=$LIBCURL_ROOT/include
    make -j 4 HYPHYMPI
    make install

    module load patchelf/0.10
RP="$(patchelf --print-rpath HYPHYMPI)$(patchelf --print-rpath hyphy)"
    patchelf --set-rpath "$RP" HYPHYMPI
    cp -av HYPHYMPI $PREFIX/bin/

Running tests, requires jumping through odd hoops. We configure a build directory in the parent, and run tests there after linking the HYPHYMP name for the hyphy executable.

    cd ..
    ln -sf build_rackham/HYPHYMPI .
    cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCURL_INCLUDE_DIR:PATH=$LIBCURL_ROOT/include
    make test


Now double check all libraries can be found

    cd $PREFIX/bin
    ml purge
    ldd hyphy
    ldd HYPHYMPI

Now build on snowy.  Remove existing unpack directory.  Build on **snowy-lr1**.

    cd /sw/bioinfo/HyPhy
    source SOURCEME_HyPhy_2.5.51-mpi
    cd $SRCDIR

    cd hyphy-${VERSION}hf

    # build in a subdirectory

    mkdir build_snowy
    cd build_snowy


    module load cmake/3.26.3
    module load gcc/11.3.0
    module load libcurl/7.85.0
    module load zstd/1.5.2
    module load zlib/1.2.12
    module load openmpi/4.1.2
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCURL_INCLUDE_DIR:PATH=$LIBCURL_ROOT/include
    make -j 4 HYPHYMPI
    make install

    module load patchelf/0.10
    RP="$(patchelf --print-rpath HYPHYMPI)$(patchelf --print-rpath hyphy)"
    patchelf --set-rpath "$RP" HYPHYMPI
    cp -av HYPHYMPI $PREFIX/bin/

    Running tests, requires jumping through odd hoops. We configure a build directory in the parent, and run tests there after linking the HYPHYMP name for the hyphy executable.

    cd ..
    ln -sf build_snowy/HYPHYMPI .
    cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCURL_INCLUDE_DIR:PATH=$LIBCURL_ROOT/include
    make test


Now double check all libraries can be found

    cd $PREFIX/bin
    ml purge
    ldd hyphy
    ldd HYPHYMPI
