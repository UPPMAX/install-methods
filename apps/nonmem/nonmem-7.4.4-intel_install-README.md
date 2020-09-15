nonmem/7.4.4
============


    TOOL=nonmem
    TOOLVERSION=7.4.4
    VERSION=${TOOLVERSION}-intel
    cd /sw/apps/nonmem
    makeroom.sh -f -t $TOOL -v $VERSION -c apps -w https://www.iconplc.com/innovation/nonmem/ -l "Commercial" -d "very general (non-interactive) model analysis program that can be used to fit models to many different types of data"
    ./makeroom_nonmem_${VERSION}.sh
    source SOURCEME_nonmem_${VERSION}
    cd $VERSION/src
    [[ -f ../../$TOOLVERSION/src/NONMEM${TOOLVERSION}.zip ]] && cp -av ../../$TOOLVERSION/src/NONMEM${TOOLVERSION}.zip . || wget https://nonmem.iconplc.com/nonmem744/NONMEM${TOOLVERSION}.zip
    unzip -P zorx7bqRT NONMEM${TOOLVERSION}.zip 
    cd nm744CD
    module load intel/19.5
    ./SETUP74 $PWD $PREFIX ifort y ar same rec i

nonmem/7.4.4-intel
========================

<https://www.iconplc.com/innovation/nonmem/>

Used under license:
Commercial

Structure creating script (makeroom_nonmem_7.4.4-intel.sh) moved to /sw/apps/nonmem/makeroom_7.4.4-intel.sh

LOG
---

    TOOL=nonmem
    VERSION=7.4.4-intel
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/nonmem/7.4.4-intel/src
    /home/douglas/bin/makeroom.sh -f" -t "nonmem" -v "7.4.4-intel" -c "apps" -w "https://www.iconplc.com/innovation/nonmem/" -l "Commercial" -d "very general \(non-interactive\) model analysis program that can be used to fit models to many different types of data"
    ./makeroom_nonmem_7.4.4-intel.sh
