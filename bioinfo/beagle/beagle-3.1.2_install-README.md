beagle/3.1.2
========================

<https://github.com/beagle-dev/beagle-lib>

Used under license:
GPL v3, LGPL v2.1

Structure creating script (makeroom_beagle_3.1.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/beagle/makeroom_3.1.2.sh

Must be built separately on rackham and on snowy, the latter building also for irma and bianca.
No guarantee that pdf docs will be built.

Add the load of  `module load java/sun_jdk1.8.0_151` to the mf file.


LOG
---

    VERSION=3.1.2
    cd /sw/bioinfo/beagle
    makeroom.sh -f -t beagle -s phylogeny -v ${VERSION} -w https://github.com/beagle-dev/beagle-lib -d "general purpose library for evaluating the likelihood of sequence evolution on trees" -l "GPL v3, LGPL v2.1"
    ./makeroom_beagle_${VERSION}.sh 

Change `SOURCEME_beagle_${VERSION}` to use `$CLUSTER` when setting `PREFIX`.

    source SOURCEME_beagle_${VERSION} 
    cd ${VERSION}/
    cd src/
    module load gcc/8.3.0
    module load java/sun_jdk1.8.0_151
    module load doxygen/1.8.11
    module load texlive/2019
    wget https://github.com/beagle-dev/beagle-lib/archive/v${VERSION}.tar.gz

    tar xzf v${VERSION}.tar.gz
    mv beagle-lib-${VERSION} beagle-lib-${VERSION}-$CLUSTER
    cd beagle-lib-${VERSION}-$CLUSTER
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make
    make doxygen-doc
    make check
    make install
    cp -av doc $PREFIX

