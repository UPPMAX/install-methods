plink2/2.00-alpha-6.20-20250707
========================

<https://www.cog-genomics.org/plink/2.0/>

Used under license:
GPL v3


Structure creating script (makeroom_plink2_2.00-alpha-6.20-20250707.sh) moved to /sw/bioinfo/plink2/makeroom_2.00-alpha-6.20-20250707.sh

LOG
---

    TOOL=plink2
    VERSIONDATE=20250707
    VERSION=2.00-alpha-6.20-$VERSIONDATE
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://www.cog-genomics.org/plink/2.0/ -l "GPL v3" -d "association analysis toolset"

    ./makeroom_plink2_2.00-alpha-6.20-20250707.sh
    source /sw/bioinfo/plink2/SOURCEME_plink2_2.00-alpha-6.20-20250707 && cd $SRCDIR
    wget https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_20250707.zip
    unzip plink2_linux_avx2_20250707.zip
    mv plink2 $PREFIX
       
Now set up the thing.

Now build `pgen_compress` from source tree.  Do NOT build plink2 from source
tree, the released binary will run much faster.  Get the source tarball from
github.

    cd $SRCDIR
    SRCVERSION=2.0.0-a.6.20
    SRCFILENAME=v${SRCVERSION}.tar.gz
    wget https://github.com/chrchang/plink-ng/archive/$SRCFILENAME
    tar xzf ${SRCFILENAME}
    
    module load gcc/14.2.0  #latest avail on Bianca as of Aug 5 2025
    cd plink-ng-${SRCVERSION}/2.0/build_dynamic

Edit Makefile to build correctly.

    vi Makefile 

Remove the "" from the `SFX ?= ""` line.  Then

    make pgen_compress
    mv pgen_compress $PREFIX/

## On Snowy because avx is not supported

not this time because Snowy fades out
    cd $VERSIONDIR
    rm snowy;mkdir snowy
    cd snowy
    wget https://s3.amazonaws.com/plink2-assets/alpha5/plink2_linux_x86_64_${VERSIONDATE}.zip
   unzip plink2_linux_x86_64_${VERSIONDATE}.zip
   rm plink2_linux_x86_64_${VERSIONDATE}.zip
   cp ../rackham/pgen_compress .
The mf file from the previous version is fine.
