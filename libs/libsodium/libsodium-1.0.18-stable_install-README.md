libsodium/1.0.18-stable
=======================

<https://doc.libsodium.org/>

Used under license:
ISC
<https://en.wikipedia.org/wiki/ISC_license>

Structure creating script (makeroom_libsodium_1.0.18-stable.sh) moved to /sw/libs/libsodium/makeroom_1.0.18-stable.sh

LOG
---

    cd /sw/libs
    TOOL=libsodium
    VERSION=1.0.18-stable
    makeroom.sh -f -t "${TOOL}" -v "${VERSION}" -c "libs" -w "https://doc.libsodium.org/" -d "Sodium is a modern, easy-to-use software library for encryption, decryption, signatures, password hashing and more." -l "ISC" -L "https://en.wikipedia.org/wiki/ISC_license"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://download.libsodium.org/libsodium/releases/${TOOL}-${VERSION}.tar.gz
    tar xf ${TOOL}-${VERSION}.tar.gz 
    cd ${TOOL}-stable/
    module load -gcc  # Use system gcc
    ./configure --prefix=$PREFIX
    make -j10
    make check
    make install

