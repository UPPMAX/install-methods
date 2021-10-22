Racon/1.4.21
============

<https://github.com/lbcb-sci/racon>

Used under license:
MIT


Structure creating script (makeroom_Racon_1.4.21.sh) moved to /sw/bioinfo/Racon/makeroom_1.4.21.sh

LOG
---

    cd /sw/bioinfo
    makeroom.sh -f -t Racon -v 1.4.21 -s assembly -w "https://github.com/lbcb-sci/racon" -l "MIT" -d "Ultrafast consensus module for raw de novo genome assembly of long uncorrected reads"
    ./makeroom_Racon_1.4.21.sh 

Restart here for snowy build.

    source /sw/bioinfo/Racon/SOURCEME_Racon_1.4.21

    cd $SRCDIR
    [[ -d racon-v${VERSION} ]] && rm -rf racon-v${VERSION}
    [[ -f racon-v${VERSION}.tar.gz ]] || wget https://github.com/lbcb-sci/racon/releases/download/${VERSION}/racon-v${VERSION}.tar.gz
    tar xf racon-v${VERSION}.tar.gz 
    cd racon-v${VERSION}

    module load git/2.28.0
    module load cmake/3.17.3
    module load gcc/9.3.0
    module load boost/1.75.0-gcc9.3.0
    module load zlib/1.2.11
    module load doxygen/1.8.11
 
Despite what it suggests in the install instructions, the submodules need to be initted here.

    git submodule update --init --recursive

Build.  The CMake policies involve setting the version, and paying attention to
*tool*_ROOT variables.  We want CMake to pay attention to `ZLIB_ROOT` to find
the module version.

    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -Dracon_build_wrapper=ON -DCMAKE_POLICY_DEFAULT_CMP0048=NEW -DCMAKE_POLICY_DEFAULT_CMP0074=NEW ..
    make && make install

Add things missed by the install.

    cp -av bin/racon_wrapper $PREFIX/bin
    cd ..
    cp -av scripts/racon_preprocess.py $PREFIX/bin

These need to be modified to work within $PREFIX directory and with `python` not being the same as `python3`.

    cd $PREFIX/bin
    chmod +x racon_preprocess.py
    chmod +w racon_wrapper
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python3,' racon_wrapper racon_preprocess.py 

The `racon_wrapper` script has some hardcoded directories, fix those.

    sed -i -e "s,$SRCDIR/racon-v$VERSION/build/vendor/rampler/bin,$PREFIX/bin," racon_wrapper
    sed -i -e "s,$SRCDIR/racon-v$VERSION/build/bin,$PREFIX/bin," racon_wrapper

I don't think there are any prereqs to be loaded during running.  It is
possible that a snowy version should be built separately, so I'll go ahead and
do that, on snowy-lr1.

