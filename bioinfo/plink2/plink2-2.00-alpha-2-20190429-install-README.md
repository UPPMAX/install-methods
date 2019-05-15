plink2/2.00-alpha-2020190429
==========================

<https://www.cog-genomics.org/plink/2.0/>

In the process, deprecated 2.00 version from plink module

LOG
---

    cd /sw/bioinfo/plink2
    VERSIONDATE=20190429
    VERSION=2.00-alpha-2-$VERSIONDATE
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -sf $CLUSTER $CL; done
    cd src
    wget http://s3.amazonaws.com/plink2-assets/plink2_linux_avx2_${VERSIONDATE}.zip
    unzip plink2_linux_avx2_${VERSIONDATE}.zip 
    mv plink2 $PFX/

Now build `pgen_compress` from source tree.  Do NOT build plink2 from source
tree, the released binary will run much faster.

    SRCVERSIONDATE=${VERSIONDATE:3}
    SRCFILENAME=plink2_src_${SRCVERSIONDATE}.zip
    mkdir ${SRCFILENAME%.zip}
    cd ${SRCFILENAME%.zip}
    wget https://www.cog-genomics.org/static/bin/${SRCFILENAME}
    unzip ${SRCFILENAME}
    module load gcc/7.4.0
    cd build_dynamic
    make pgen_compress
    mv pgen_compress $PFX/
