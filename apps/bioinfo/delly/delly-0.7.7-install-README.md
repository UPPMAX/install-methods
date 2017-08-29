delly 0.7.7
===========

<https://github.com/dellytools/delly>

Clone the repository, and checkout the version tag.

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
    git checkout v${VERSION}

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
    cp -v src/bcftools/bcftools $PFX/
    cp -v src/bcftools/misc/{color-chrs.pl,plot-vcfstats,run-roh.pl,vcfutils.pl} $PFX/
    cp -v src/htslib/{bgzip,htsfile,tabix} $PFX/
    mkdir -p $PFX/libexec/bcftools
    cp -v src/bcftools/plugins/*.so $PFX/libexec/bcftools/

    mkdir -p $PFX/man/man1
    cp -v src/bcftools/doc/bcftools.1 $PFX/man/man1/
    cp -v src/htslib/{htsfile.1,tabix.1} $PFX/man/man1/

Provide the precompiled static version as `delly_static`. 

    cd $PFX
    wget https://github.com/dellytools/delly/releases/download/v${VERSION}/delly_v${VERSION}_parallel_linux_x86_64bit
    mv -v delly_v${VERSION}_parallel_linux_x86_64bit delly_static
    chmod +x delly_static

Edit `#!` line of installed perl scripts to use the env mechanism, if necessary.

    vi *.pl

Since it doesn't add the gcc library path, we add it in the mf file.  Prepend
`/sw/comp/gcc/5.4.0_$Cluster/lib64` to `LD_LIBRARY_PATH`.  Also, add
`$modroot` to `PATH`, `$modroot/man` to `MANPATH`.
