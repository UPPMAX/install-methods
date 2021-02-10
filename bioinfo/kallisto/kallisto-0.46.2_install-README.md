kallisto/0.46.2
========================

<https://github.com/pachterlab/kallisto>

Used under license:
BSD-2 license
<>

Structure creating script (makeroom_kallisto_0.46.2.sh) moved to /sw/bioinfo/kallisto/makeroom_0.46.2.sh

LOG
---

    TOOL=kallisto
    VERSION=0.46.2
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/kallisto/0.46.2/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "kallisto" -v "0.46.2" -w "https://github.com/pachterlab/kallisto" -c "bioinfo" -l "BSD-2 license" -d "kallisto is a program for quantifying abundances of transcripts from RNA-Seq data\, or more generally of target sequences using high-throughput sequencing reads." -x "INSTALL" -f
    ./makeroom_kallisto_0.46.2.sh

    module load cmake/3.13.2
    module load gcc/8.3.0
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/archive/v${VERSION}.tar.gz
    [[ -d kallisto-$VERSION ]] && rm -rf kallisto-$VERSION
    tar xzf v${VERSION}.tar.gz
    cd kallisto-$VERSION
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX
    make
    make install
    cd ../..
    [[ -d kallisto-$VERSION ]] && rm -rf kallisto-$VERSION

Reuse the previous mf.


## The line below not used in current installation
### Only run this if you want to install prebuilt binaries

You should be positioned within `src/`.  These are statically linked to the C++ and HDF5 libraries.

    [[ -f kallisto_linux-v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/releases/download/v${VERSION}/kallisto_linux-v${VERSION}.tar.gz
    tar xzf kallisto_linux-v${VERSION}.tar.gz 
    cd kallisto_linux-v${VERSION}
    mkdir $PFX/bin
    cp -av kallisto $PFX/bin

