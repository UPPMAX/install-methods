ninja/1.10.0
========================

<https://ninja-build.org/>

Used under license:
Apache 2.0
<>

Structure creating script (makeroom_ninja_1.10.0.sh) moved to /sw/build/ninja/makeroom_1.10.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -c "build" -t "ninja" -v "1.10.0" -w "https://ninja-build.org/" -d "a small build system with a focus on speed" -l "Apache 2.0"
    ./makeroom_ninja_1.10.0.sh
ninja/1.9.0
==========

Ninja build system.  A prereq for Meson and probably other things.

<https://ninja-build.org/>

Ninja is available as a linux executable, but requires g++ libs newer than the
system default.  I updated the RPATH info of the executable to include the
`LD_RUN_PATH` directory for `gcc/7.4.0`.


LOG
---

    cd /sw/apps/build/
    mkdir ninja
    cd ninja
    VERSION=1.9.0
    mkdir $VERSION
    mkdir mf
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src
    wget https://github.com/ninja-build/ninja/releases/download/v${VERSION}/ninja-linux.zip
    unzip ninja-linux.zip 
    ldd ninja
    module load gcc/7.4.0
    ldd ninja
    echo $LD_RUN_PATH
    patchelf --set-rpath $LD_RUN_PATH ninja
    module unload gcc
    ldd ninja
    chmod +x ninja
    mv ninja $PFX

Add `$PFX` to the mf file.
