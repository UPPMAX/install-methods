MaSuRCA/3.3.5
========================

<https://github.com/alekseyzimin/masurca>

Used under license:
GPL v3

Structure creating script (makeroom_MaSuRCA_3.3.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MaSuRCA/makeroom_3.3.5.sh

The `install.sh` script recognises a `DEST` variable, but that does not install
`Flye/`, at least.  So, replace the `$CLUSTER` directory with the unpacked
directory, and build in place.

Also, ensure that `PATH` is very clean.


LOG
---

    TOOL=MaSuRCA
    VERSION=3.3.5
    cd /sw/bioinfo/${TOOL}
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://github.com/alekseyzimin/masurca -d "https://github.com/alekseyzimin/masurca" -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 

    echo $PATH
    export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sw/uppmax/bin
    cd ${VERSION}
    rmdir $PREFIX
    cd src
    wget https://github.com/alekseyzimin/masurca/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    tar xzf ${TOOL}-${VERSION}.tar.gz 
    mv ${TOOL}-${VERSION} $PREFIX
    module load perl/5.26.2 perl_modules/5.26.2
    module load gcc/8.3.0
    cd $PREFIX
    ./install.sh 

