SDSL/2.1.1
==========

<https://github.com/simongog/sdsl-lite>

Used under license:
GPL
<https://raw.githubusercontent.com/simongog/sdsl-lite/master/COPYING>

Structure creating script (makeroom_SDSL_2.1.1.sh) moved to /sw/libs/SDSL/makeroom_2.1.1.sh

LOG
---

For compatibility, building with gcc/5.4.0.

Also, add shared libraries to the build.

Need to build separately for snowy and rackham/irma/bianca/miarka, because
snowy doesn't have AVX2 instructions, while all clusters have SSE4.2
instructions.

    cd /sw/libs
    makeroom.sh -t SDSL -v 2.1.1 -c libs -w "https://github.com/simongog/sdsl-lite" -l "GPL" -L https://raw.githubusercontent.com/simongog/sdsl-lite/master/COPYING -d "a powerful and flexible C++11 library implementing succinct data structures"
    ./makeroom_SDSL_2.1.1.sh 
    source /sw/libs/SDSL/SOURCEME_SDSL_2.1.1 && cd $SRCDIR
    wget https://github.com/simongog/sdsl-lite/releases/download/v2.1.1/sdsl-lite-2.1.1.tar.gz.offline.install.gz

On rackham:

    source /sw/libs/SDSL/SOURCEME_SDSL_2.1.1 && cd $SRCDIR
    tar xf sdsl-lite-2.1.1.tar.gz.offline.install.gz
    cd sdsl-lite-2.1.1/
    ml gcc/5.4.0 git/2.34.1 cmake/3.22.2 doxygen/1.8.11
    ./install.sh $PREFIX
    cd ..
    rm -rf sdsl-lite-2.1.1

    # build shared libraries

    tar xf sdsl-lite-2.1.1.tar.gz.offline.install.gz
    cd sdsl-lite-2.1.1/
    sed 's/^\(cmake .*PREFIX}"\) \(\.\..*\)$/\1 -DBUILD_SHARED_LIBS=ON \2/' < install.sh > install-shared.sh
    chmod +x install-shared.sh
    ./install-shared.sh $PREFIX
    cd ..
    rm -rf sdsl-lite-2.1.1

On snowy:

    source /sw/libs/SDSL/SOURCEME_SDSL_2.1.1 && cd $VERSIONDIR
    rm -f snowy
    mkdir snowy
    cd $SRCDIR

    # double-check that PREFIX refers to snowy
    echo $PREFIX

    tar xf sdsl-lite-2.1.1.tar.gz.offline.install.gz
    cd sdsl-lite-2.1.1/
    ml gcc/5.4.0 git/2.34.1 cmake/3.22.2 doxygen/1.8.11
    ./install.sh $PREFIX
    cd ..
    rm -rf sdsl-lite-2.1.1

    # build shared libraries

    tar xf sdsl-lite-2.1.1.tar.gz.offline.install.gz
    cd sdsl-lite-2.1.1/
    sed 's/^\(cmake .*PREFIX}"\) \(\.\..*\)$/\1 -DBUILD_SHARED_LIBS=ON \2/' < install.sh > install-shared.sh
    chmod +x install-shared.sh
    ./install-shared.sh $PREFIX
    cd ..
    rm -rf sdsl-lite-2.1.1

