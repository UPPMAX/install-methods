# SPP-1.11-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

SPP 1.11

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

Load boost module, and add `/sw/apps/bioinfo/SPP/1.11/milou` to the 
user's `R_LIBS_USER` variable.


LOG
---

    TOOL=/sw/apps/bioinfo/SPP
    VERSION=1.11
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    mkdir mf src
    cd src
    wget http://cran.fhcrc.org/src/contrib/bitops_1.0-6.tar.gz
    wget http://cran.r-project.org/src/contrib/caTools_1.16.tar.gz
    wget http://compbio.med.harvard.edu/Supplements/ChIP-seq/spp_1.11.tar.gz
    module load boost
    R CMD INSTALL -l /sw/apps/bioinfo/SPP/1.11/milou/ bitops_1.0-6.tar.gz 
    R CMD INSTALL -l /sw/apps/bioinfo/SPP/1.11/milou/ caTools_1.16.tar.gz 
    R CMD INSTALL -l /sw/apps/bioinfo/SPP/1.11/milou/ spp_1.11.tar.gz 


Steal an mf from another project, we need to load boost and add $CLUSTERDIR to R_LIBS_USER.

