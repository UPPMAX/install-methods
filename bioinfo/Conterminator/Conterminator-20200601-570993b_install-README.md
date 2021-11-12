Conterminator/20200601-570993b
========================

<https://github.com/martin-steinegger/conterminator>

Used under license:
GPL v3


Structure creating script (makeroom_Conterminator_20200601-570993b.sh) moved to /sw/bioinfo/Conterminator/makeroom_20200601-570993b.sh

LOG
---


    TOOL=Conterminator
    VERSION=20200601-570993b
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/martin-steinegger/conterminator -l "GPL v3" -d "Conterminator is an efficient method for detecting incorrectly labeled sequences across kingdoms by an exhaustive all-against-all sequence comparison. "
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    
    cd $SRCDIR
    git clone --recursive https://github.com/martin-steinegger/conterminator
    cd conterminator
    git reset --hard 570993b

    mkdir build 
    cd build
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make -j 4
    make install
