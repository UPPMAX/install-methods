nonmem/7.4.4
============


    TOOL=nonmem
    VERSION=7.4.4
    cd /sw/apps/nonmem
    makeroom.sh -f -t $TOOL -v $VERSION -c apps -w https://www.iconplc.com/innovation/nonmem/ -l "Commercial" -d "very general (non-interactive) model analysis program that can be used to fit models to many different types of data"
    ./makeroom_nonmem_${VERSION}.sh
    source SOURCEME_nonmem_${VERSION}
    cd $VERSION/src
    wget https://nonmem.iconplc.com/nonmem744/NONMEM${VERSION}.zip
    unzip -P zorx7bqRT NONMEM${VERSION}.zip 
    cd nm744CD
    module load gcc/8.3.0
    ./SETUP74 $PWD $PREFIX gfortran y ar same rec i

