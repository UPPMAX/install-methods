plink2/2.00-alpha-2.3-20200124
==============================

<https://www.cog-genomics.org/plink/2.0/>

Used under license:
GPL v3

Structure creating script (makeroom_plink2_2.00-alpha-2.3-20200124.sh) moved to /sw/bioinfo/plink2/makeroom_2.00-alpha-2.3-20200124.sh

LOG
---

Get the explicit version directly from the latest executable.

    cd /sw/bioinfo/plink2/
    mkdir t
    wget http://s3.amazonaws.com/plink2-assets/alpha2/plink2_linux_avx2.zip
    unzip plink2_linux_avx2.zip 
    ./plink2 
    cd ..
    rm -rf t

Now set up the thing.

    TOOL=plink2
    VERSIONDATE=20200124
    VERSION=2.00-alpha-2.3-$VERSIONDATE
    cd /sw/bioinfo/plink2
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://www.cog-genomics.org/plink/2.0/ -l "GPL v3" -d "association analysis toolset" 
    ./makeroom_plink2_2.00-alpha-2.3-20200124.sh 
    source SOURCEME_plink2_2.00-alpha-2.3-20200124
    cd $VERSIONDIR
    cd src
    wget http://s3.amazonaws.com/plink2-assets/alpha2/plink2_linux_avx2.zip
    unzip plink2_linux_avx2.zip 
    mv plink2 $PREFIX/


Now build `pgen_compress` from source tree.  Do NOT build plink2 from source
tree, the released binary will run much faster.  Get the source tarball from
github.

    cd $SRCDIR
    SRCVERSION=2.00a2.3
    SRCFILENAME=v${SRCVERSION}.tar.gz
    wget https://github.com/chrchang/plink-ng/archive/$SRCFILENAME
    tar xzf ${SRCFILENAME}
    module load gcc/8.3.0
    cd plink-ng-${SRCVERSION}/2.0/build_dynamic
    make pgen_compress
    mv pgen_compress $PREFIX/

The mf file from the previous version is fine.
