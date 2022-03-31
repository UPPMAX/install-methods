libicu/5.2-4
========================

<https://centos.pkgs.org/7/centos-x86_64/libicu-50.2-4.el7_7.x86_64.rpm.html>

Used under license:
MIT and UCD and public domain


Structure creating script (makeroom_libicu_5.2-4.sh) moved to /sw/libs/libicu/makeroom_5.2-4.sh

LOG
---

Motivated and installed like readline/6.2-11, BUT the libraries self-refer, so must have their own RPATH updated as well.

    makeroom.sh -t libicu -v 5.2-4 -c libs -w "https://centos.pkgs.org/7/centos-x86_64/libicu-50.2-4.el7_7.x86_64.rpm.html" -l "MIT and UCD and public domain" -d "provide robust and full-featured Unicode services"
    ./makeroom_libicu_5.2-4.sh 
    source /sw/libs/libicu/SOURCEME_libicu_5.2-4 && cd $SRCDIR
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libicu-50.2-4.el7_7.x86_64.rpm
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libicu-devel-50.2-4.el7_7.x86_64.rpm
    cd $PREFIX
    rpm2cpio $SRCDIR/libicu-50.2-4.el7_7.x86_64.rpm | cpio -idm
    rpm2cpio $SRCDIR/libicu-devel-50.2-4.el7_7.x86_64.rpm | cpio -idm

Now set RPATH for each library to have the library directory.  They refer to libicudata.so.50 which cannot be found because their own RPATH does not include its directory.

    cd $PREFIX/usr/lib64/
    ml patchelf/0.10
    for L in *.so ; do echo;echo $L;patchelf --set-rpath $PWD $L; done

The mf is like readline/6.2-11.

