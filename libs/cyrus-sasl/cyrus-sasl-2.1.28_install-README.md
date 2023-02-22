cyrus-sasl/2.1.28
========================

<https://github.com/cyrusimap/cyrus-sasl>

Used under license:


Structure creating script (makeroom_cyrus-sasl_2.1.28.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/cyrus-sasl/makeroom_2.1.28.sh

LOG
---

    TOOL=cyrus-sasl
    VERSION=2.1.28

    makeroom.sh -f -c libs -t $TOOL -v $VERSION -w https://github.com/cyrusimap/cyrus-sasl -l "Custom open-source AS IS" -L https://raw.githubusercontent.com/cyrusimap/cyrus-sasl/master/COPYING -d "Cyrus SASL API implementation which can be used on the client or server side to provide authentication and authorization services"

    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/libs/$TOOL

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    wget https://github.com/cyrusimap/${TOOL}/releases/download/${TOOL}-${VERSION}/${TOOL}-${VERSION}.tar.gz
    tar xf ${TOOL}-${VERSION}.tar.gz

    cd ${TOOL}-${VERSION}

    ./configure --prefix=$PREFIX

    make
    make install

