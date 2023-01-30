plink2/2.00-alpha-3.7-20221024
========================

<https://www.cog-genomics.org/plink/2.0/>

Used under license:
GPL v3


Structure creating script (makeroom_plink2_2.00-alpha-3.7-20221024.sh) moved to /sw/bioinfo/plink2/makeroom_2.00-alpha-3.7-20221024.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "plink2" "-v" "2.00-alpha-3.7-20221024" "-s" "misc" "-w" "https://www.cog-genomics.org/plink/2.0/" "-l" "GPL v3" "-d" "association analysis toolset" "-f"
    ./makeroom_plink2_2.00-alpha-3.7-20221024.sh
    /sw/bioinfo/plink2/SOURCEME_plink2_2.00-alpha-3.7-20221024 && cd $TOOLDIR
    cd $SRCDIR
    wget https://s3.amazonaws.com/plink2-assets/alpha3/plink2_linux_avx2_20221024.zip
    unzip plink2_linux_avx2_20221024.zip
    mv plink2 $PREFIX

Now set up the thing.

Now build `pgen_compress` from source tree.  Do NOT build plink2 from source
tree, the released binary will run much faster.  Get the source tarball from
github.

    cd $SRCDIR
    SRCVERSION=2.00a3.7
    SRCFILENAME=v${SRCVERSION}.tar.gz
    wget https://github.com/chrchang/plink-ng/archive/$SRCFILENAME
    tar xzf ${SRCFILENAME}
    module load gcc/9.3.0
    cd plink-ng-${SRCVERSION}/2.0/build_dynamic

Edit Makefile to build correctly.

    vi /sw/bioinfo/plink2/2.00-alpha-3.7-20221024/src/plink-ng-2.00a3.7/2.0/build_dynamic

Remove the "" from the `SFX ?= ""` line.  Then

    make pgen_compress
    mv pgen_compress $PREFIX/

The mf file from the previous version is fine.
