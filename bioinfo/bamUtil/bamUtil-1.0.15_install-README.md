bamUtil/1.0.15
==============

<https://github.com/statgen/bamUtil>

Used under license:
GPL v3


Structure creating script (makeroom_bamUtil_1.0.15.sh) moved to /sw/bioinfo/bamUtil/makeroom_1.0.15.sh

LOG
---

    makeroom.sh -t bamUtil -v 1.0.15 -s misc -l "GPL v3" -w https://github.com/statgen/bamUtil -d "Some programs for working on SAM/BAM files"
    ./makeroom_bamUtil_1.0.15.sh 
    source /sw/bioinfo/bamUtil/SOURCEME_bamUtil_1.0.15
    cd $SRCDIR
    ml git/2.34.1
    ml gcc/12.3.0
    git clone --recursive https://github.com/statgen/bamUtil
    cd bamUtil/
    ml cmake/3.26.3
    ml zlib/1.3
    ml binutils/2.41
    make cloneLib
    make
    make install INSTALLDIR=$PREFIX

Test.

    cd $PREFIX
    module purge
    ldd bam
    ./bam

Wrap up.

    cd $TOOLDIR
    vi mf/$VERSION

    ./bamUtil-1.0.15_post-install.sh
