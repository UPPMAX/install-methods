BclConverter/3.9.3
==================

<https://support-docs.illumina.com/SW/BCL_Convert/Content/SW/FrontPages/BCL_Convert.htm>

Used under license:
Illumina (c)


Structure creating script (makeroom_BclConverter_3.9.3.sh) moved to /sw/bioinfo/BclConverter/makeroom_3.9.3.sh

LOG
---


    makeroom.sh -f -t BclConverter -v 3.9.3 -w https://support-docs.illumina.com/SW/BCL_Convert/Content/SW/FrontPages/BCL_Convert.htm -l "Illumina (c)" -d "converts per cycle binary data output by Illumina sequencers containing basecall files and quality scores to per read FASTQ files"
    ./makeroom_BclConverter_3.9.3.sh 
    source /sw/bioinfo/BclConverter/SOURCEME_BclConverter_3.9.3 && cd $SRCDIR

Transfer RPM over from laptop.  Can't install using `rpm --install --prefix` so
unroll the RPM and move the binary over.

    rpm2cpio bcl-convert-3.9.3-2.el7.x86_64.rpm | cpio -diumv
    mv usr/bin $PREFIX/
    rm -rf usr
    ls -lR $PREFIX
    ldd $PREFIX/bin/bcl-convert
    $PREFIX/bin/bcl-convert --help

