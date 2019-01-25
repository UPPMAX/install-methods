LDhelmet/1.9
============

Fine-scale recombination map estimation

Andrew H. Chan, Paul A. Jenkins, Yun S. Song (2012). Genome-wide 
fine-scale recombination rate variation in Drosophila melanogaster. 
PLoS Genet 8(12): e1003090. doi:10.1371/journal.pgen.1003090

<http://sourceforge.net/projects/ldhelmet/>


LOG
---

    TOOL=/sw/apps/bioinfo/LDhelmet
    mkdir -p $TOOL
    cd $TOOL
    VERSION=1.9
    mkdir -p src $VERSION
    TOOLDIR=$TOOL/$VERSION
    cd $TOOLDIR
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p src $CLUSTER
    cd src
    [[ -f LDhelmet_v${VERSION}.tgz ]] || wget http://downloads.sourceforge.net/project/ldhelmet/LDhelmet_v${VERSION}.tgz
    tar xvzf LDhelmet_v${VERSION}.tgz 
    cd LDhelmet_v${VERSION}/

    view README.txt 

We see we need boost and GSL.  The instructions have us modifying Makefil so
that INC_FLAG and LIB_FLAG point to the includ and library locations for boost
and GSL.  Since the boost and GSL modules set these for us, there is no need to
modify these variables (hopefully...)

    module load build-tools
    module load gcc/4.8.3
    module load boost/1.55.0_gcc4.8.3
    module load gsl/1.16

    vi Makefile

Edit Makefile to have the following.

    INC_FLAG = -I${BOOST_ROOT}/include -I${GSL_ROOT}/include
    LIB_FLAG = -L${BOOST_ROOT}/lib -L${GSL_ROOT}/lib

Now build it and copy it to the cluster directory.

    make -j 12  # runs quickly...
    cp ldhelmet $CLUSTERDIR
    cp LDhelmet_manual_v${VERSION}.pdf $CLUSTERDIR

