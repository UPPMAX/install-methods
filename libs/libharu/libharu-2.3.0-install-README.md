libharu, provides libhpdf
=========================

    cd /sw/libs
    mkdir libharu
    cd libharu/
    mkdir 2.3.0 mf
    cd 2.3.0/
    mkdir milou tintin src
    cd src
    wget https://github.com/libharu/libharu/archive/RELEASE_2_3_0.tar.gz
    tar xzf RELEASE_2_3_0.tar.gz 
    cd libharu-RELEASE_2_3_0/
    module load gcc/4.9.2
    ./buildconf.sh --force
    ./configure --prefix=/sw/libs/libharu/2.3.0/milou

    make
    make install

Borrow mf from libcurl.

    cd /sw/libs/libharu/mf
    cp ../../libcurl/mf/7.45.0 2.3.0
    vi 2.3.0 

Repeat for tintin.
