# breakdancer-1.4.5-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    breakdancer 1.4.5

DESCRIPTION
-----------

    breakdancer 1.4.5

    Ken Chen, John W Wallis, Michael D McLellan, David E Larson, Joelle M Kalicki,
    Craig S Pohl, Sean D McGrath, Michael C Wendl, Qunyuan Zhang, Devin P Locke,
    Xiaoqi Shi, Robert S Fulton, Timothy J Ley, Richard K Wilson, Li Ding & Elaine
    R Mardis.  2009.  BreakDancer: an algorithm for high-resolution mapping of
    genomic structural variation.  Nature Methods 6:677-681.


WEBSITE
-------

    http://gmt.genome.wustl.edu/packages/breakdancer/index.html

MODULE REQUIREMENTS
-------------------

Breakdancer has two executable directories as well as some Perl modules.

LOG
---

    TOOL=/sw/apps/bioinfo/breakdancer
    VERSION=1.4.5
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    git clone --recursive https://github.com/genome/breakdancer.git
    cd breakdancer/
    mkdir build
    cd build
    module load perl/5.18.2
    module load build-tools
    module load gcc/4.8.3
    module load python/2.7.6
    cmake ..  -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/sw/apps/bioinfo/breakdancer/$VERSION/milou
    make
    make install

Rather than reinstall all the perl modules required, I just copied them
over from the build of 1.4.4-u7, thanks Wes :-)

    cd $TOOL/1.4.4-u7/milou
    cp -av gd perl ../../1.4.5/milou

For the mf, add

    module load perl/5.18.2
    # for breakdancer-max
    prepend-path    PATH            $modroot/bin
    # for bam2cfg.pl
    prepend-path    PATH            $modroot/lib/breakdancer-max1.4.5
    prepend-path    PERL5LIB    $modroot/perl/lib/perl5
    # so we do not have to load gcc/4.8.3
    prepend-path    LD_LIBRARY_PATH     /sw/comp/gcc/4.8_milou/lib64/


To build on tintin, remove the build directory and re-cmake and re-make


    TOOL=/sw/apps/bioinfo/breakdancer
    VERSION=1.4.5
    CLUSTER=tintin
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $VERSIONDIR
    cd src
    cd breakdancer/
    rm -rf build
    mkdir build
    cd build
    module load perl/5.18.2
    module load build-tools
    module load gcc/4.8.3
    module load python/2.7.6
    cmake ..  -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/sw/apps/bioinfo/breakdancer/$VERSION/milou
    make
    make install

    cd $TOOL/1.4.4-u7/milou
    cp -av gd perl ../../1.4.5/tintin

