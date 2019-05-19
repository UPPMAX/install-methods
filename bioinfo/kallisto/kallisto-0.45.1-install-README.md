kallisto/0.45.1
===============

Quantifying abundances of transcripts from RNA-Seq data.

<http://pachterlab.github.io/kallisto/>

LOG
---

Install on rackham.  By default we install from source.  See the end for installing from prebuilt.

    VERSION=0.45.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/kallisto
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src

    #    This installs from source

    module load cmake/3.13.2
    module load gcc/8.3.0
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/archive/v${VERSION}.tar.gz
    [[ -d kallisto-$VERSION ]] && rm -rf kallisto-$VERSION
    tar xzf v${VERSION}.tar.gz
    cd kallisto-$VERSION
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$PFX
    make
    make install
    cd ../..
    [[ -d kallisto-$VERSION ]] && rm -rf kallisto-$VERSION

Reuse the previous mf.



### Only run this if you want to install prebuilt binaries

You should be positioned within `src/`.  These are statically linked to the C++ and HDF5 libraries.

    [[ -f kallisto_linux-v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/releases/download/v${VERSION}/kallisto_linux-v${VERSION}.tar.gz
    tar xzf kallisto_linux-v${VERSION}.tar.gz 
    cd kallisto_linux-v${VERSION}
    mkdir $PFX/bin
    cp -av kallisto $PFX/bin

