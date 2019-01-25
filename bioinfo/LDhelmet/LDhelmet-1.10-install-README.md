LDhelmet/1.10
============

Fine-scale recombination map estimation

Andrew H. Chan, Paul A. Jenkins, Yun S. Song (2012). Genome-wide 
fine-scale recombination rate variation in Drosophila melanogaster. 
PLoS Genet 8(12): e1003090. doi:10.1371/journal.pgen.1003090

<http://sourceforge.net/projects/ldhelmet/>


LOG
---

    TOOL=/sw/apps/bioinfo/LDhelmet
    VERSION=1.10
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL ; done
    cd src
    [[ -f LDhelmet_v${VERSION}.tgz ]] || wget http://downloads.sourceforge.net/project/ldhelmet/LDhelmet_v${VERSION}.tgz
    [[ -d LDhelmet_v${VERSION} ]] && rm -rf LDhelmet_v${VERSION}
    tar xvzf LDhelmet_v${VERSION}.tgz 
    cd LDhelmet_v${VERSION}/

    view README.txt 

We see we need boost and GSL.  The instructions have us modifying Makefile so
that INC_FLAG and LIB_FLAG point to the include and library locations for boost
and GSL.  Since the boost and GSL modules set these for us, there is no need to
modify these variables (hopefully...)

    module load gcc/4.8.3
    module load boost/1.55.0_gcc4.8.3
    module load gsl/1.16

    vi Makefile

Edit Makefile to have the following.

    INC_FLAG = -I${BOOST_ROOT}/include -I${GSL_ROOT}/include
    LIB_FLAG = -L${BOOST_ROOT}/lib -L${GSL_ROOT}/lib

Now build it and copy it to the prefix directory.

    make -j 12  # runs quickly...
    cp ldhelmet $PFX/
    cp LDhelmet_manual_v${VERSION}.pdf $PFX/

