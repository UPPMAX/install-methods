plink2/2.00-alpha-5-20230923
========================

<https://www.cog-genomics.org/plink/2.0/>

Used under license:
GPL v3


Structure creating script (makeroom_plink2_2.00-alpha-5-20230923.sh) moved to /sw/bioinfo/plink2/makeroom_2.00-alpha-5-20230923.sh

LOG
---

    VERSIONDATE=20200124
    VERSIONDATE=20230923
    VERSION=2.00-alpha-5-$VERSIONDATE
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://www.cog-genomics.org/plink/2.0/ -l "GPL v3" -d "association analysis toolset"

    ./makeroom_plink2_2.00-alpha-5-20230923.sh
    source /sw/bioinfo/plink2/SOURCEME_plink2_2.00-alpha-5-20230923 && cd $TOOLDIR
    cd $SRCDIR
    wget https://s3.amazonaws.com/plink2-assets/alpha3/plink2_linux_avx2_20221024.zip
    unzip plink2_linux_avx2_20230923.zip
    mv plink2 $PREFIX

Now set up the thing.

Now build `pgen_compress` from source tree.  Do NOT build plink2 from source
tree, the released binary will run much faster.  Get the source tarball from
github.

    cd $SRCDIR
    SRCVERSION=2.00a5
    SRCFILENAME=v${SRCVERSION}-final.tar.gz
    wget https://github.com/chrchang/plink-ng/archive/$SRCFILENAME
    tar xzf ${SRCFILENAME}
    module load gcc/11.3.0  #latest avail on Bianca as of Oct2 2023
    cd plink-ng-${SRCVERSION}/2.0/build_dynamic

Edit Makefile to build correctly.

    vi Makefile 

Remove the "" from the `SFX ?= ""` line.  Then

    make pgen_compress
    mv pgen_compress $PREFIX/

## On Snowy because avx is not supported

    cd $VERSIONDIR
    rm snowy;mkdir snowy
    cd snowy
    wget https://s3.amazonaws.com/plink2-assets/alpha5/plink2_linux_x86_64_${VERSIONDATE}.zip
   unzip plink2_linux_x86_64_${VERSIONDATE}.zip
   rm plink2_linux_x86_64_${VERSIONDATE}.zip
   cp ../rackham/pgen_compress .
The mf file from the previous version is fine.
