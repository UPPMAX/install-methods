delly 0.7.7
===========

<https://github.com/dellytools/delly>

Need mummer and some others and some python directories, see 0.7.2.


LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=0.7.7
    cd /sw/apps/bioinfo/delly
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER

    module load git/2.10.2
    git clone --recursive https://github.com/dellytools/delly.git
    cd delly

Takes a long time to get the boost stuff.

The gcc version must be 5.4.0, both 6.3.0 and 6.2.0 gives errors
(<https://groups.google.com/forum/#!topic/delly-users/AYj-HaD2kL0>).

    module load gcc/5.4.0

The `prefix` must be set to find the `bcftools` plugins, and probably other
reasons.

    make PARALLEL=1 prefix=$PFX -B src/delly
    make PARALLEL=1 prefix=$PFX all

And copy delly, bcftools and htslib executables, scripts, `bcftools` plugins and man pages.

    cp -v src/{cov,delly,dpe} $PFX/
    cp -v src/bcftools/{bcftools,plot-vcfstats,vcfutils.pl} $PFX/
    cp -v src/bcftools/plugins/color-chrs.pl $PFX/
    cp -v src/htslib/{bgzip,htsfile,tabix} $PFX/
    mkdir -p $PFX/libexec/bcftools
    cp -v src/bcftools/plugins/*.so $PFX/libexec/bcftools/

    mkdir -p $PFX/man/man1
    cp -v src/bcftools/doc/bcftools.1 $PFX/man/man1/
    cp -v src/htslib/{htsfile,tabix}.1 $PFX/man/man1/

Edit `#!` line of perl scripts to use the env mechanism, if necessary.

    vi $PFX/*.pl

Since it doesn't add the gcc library path, we add it in the mf file.  Prepend
`/sw/comp/gcc/5.4.0_$Cluster/lib64` to `LD_LIBRARY_PATH`.  Also, add
`$modroot` to `PATH`, `$modroot/man` to `MANPATH`.
