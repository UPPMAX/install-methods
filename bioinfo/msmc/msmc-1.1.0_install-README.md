msmc/1.1.0
========================

<https://github.com/stschiff/msmc>

Used under license:
GPL v3

Structure creating script (makeroom_msmc_1.1.0.sh) moved to /sw/bioinfo/msmc/makeroom_1.1.0.sh

LOG
---

msmc is written in D.  In lieu of installing a new D compiler, I am just taking
the 64-bit Linux executable, which seems to work fine.  Only problem is, its
reported version is 1.0.1 but it is 1.1.0, following the github commits.
We'll download both that and the source bundle.

    cd /sw/bioinfo/msmc
    TOOL=msmc
    VERSION=1.1.0
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/stschiff/msmc -l "GPL v3" -d "implements MSMC, a method to infer population size and gene flow from multiple genome sequences" 
    ./makeroom_msmc_1.1.0.sh 
    source SOURCEME_msmc_1.1.0 
    cd 1.1.0/
    cd src/
    wget https://github.com/stschiff/msmc/releases/download/v1.1.0/msmc_1.1.0_linux64bit
    wget https://github.com/stschiff/msmc/archive/v1.1.0.tar.gz
    ldd msmc_1.1.0_linux64bit 
    mkdir $PREFIX/bin
    cp msmc_1.1.0_linux64bit $PREFIX/bin
    cd $PREFIX/bin
    chmod +x msmc_1.1.0_linux64bit 
    ln -s msmc_1.1.0_linux64bit msmc
    ./msmc

Add a message about the mismatching versions to the mf file.

    cd $TOOLDIR
    vi mf/1.1.0
    ./msmc-1.1.0_post-install.sh

