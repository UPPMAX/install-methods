# SPP-1.11-irma-install-README.md, wesleys

TITLE
=====

SPP 1.11 (irma)

DESCRIPTION
-----------

ChIP-seq processing pipeline

Kharchenko PK, Tolstorukov MY, Park PJ. Design and analysis of ChIP-seq 
experiments for DNA-binding proteins.  *Nat. Biotech.* doi:10.1038/nbt.1508


WEBSITE
-------

<http://compbio.med.harvard.edu/Supplements/ChIP-seq/>


MODULE REQUIREMENTS
-------------------

Installed nearly the same way as SPP-1.11-install-README.md (Milou)
except that spp fails with system R (currently 3.3.0). A quick test
shows the same failure on Milou with system R (3.3.0).

Also note that bitops fails with gcc/4.9.2 on Irma despite Milou
apparently using system gcc (4.4.7).


LOG
---
    TOOL=/sw/apps/bioinfo/SPP
    VERSION=1.11
    # CLUSTER=irma
    R_LIBS_USER=$TOOL/$VERSION/$CLUSTER
    mkdir -p $R_LIBS_USER
    # cd src
    cd $TOOL/$VERSION/src
    # wget http://cran.fhcrc.org/src/contrib/bitops_1.0-6.tar.gz
    # wget http://cran.r-project.org/src/contrib/caTools_1.16.tar.gz
    # wget http://compbio.med.harvard.edu/Supplements/ChIP-seq/spp_1.11.tar.gz
    module load R/3.2.3
    module load gcc/5.3.0
    module load boost/1.61.0_gcc5.3.0
    R CMD INSTALL -l $R_LIBS_USER/ bitops_1.0-6.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ caTools_1.16.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ spp_1.11.tar.gz 


Note that compilation of spp shows a number of deprecation warnings.
