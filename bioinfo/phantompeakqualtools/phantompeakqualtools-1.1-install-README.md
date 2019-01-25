    mkdir -p /sw/apps/bioinfo/phantompeakqualtools
    cd /sw/apps/bioinfo/phantompeakqualtools
    VERSION=1.1
    TOOL=$PWD
    mkdir -p $TOOL/src
    cd $TOOL/src
    wget https://phantompeakqualtools.googlecode.com/files/ccQualityControl.v.1.1.tar.gz
    tar xzf ccQualityControl.v.1.1.tar.gz 
    cd phantompeakqualtools/
    cd ..
    chmod -R g+rwX,o+rX *
    echo $CLUSTER
    mkdir -p $TOOL/$VERSION/$CLUSTER
    cd $TOOL/$VERSION/$CLUSTER
    mkdir R_packages
    cd R_packages/
    R_LIBS_USER=$PWD
    cd ../../../src
    wget https://cran.r-project.org/src/contrib/bitops_1.0-6.tar.gz
    wget https://cran.r-project.org/src/contrib/caTools_1.17.1.tar.gz
    wget https://cran.r-project.org/src/contrib/snow_0.3-13.tar.gz
    module load bioinfo-tools
    module load samtools/0.1.19
    module load boost/1.59.0_gcc4.9.2
    module load gcc/4.9.2
    R CMD INSTALL -l $R_LIBS_USER/ bitops_1.0-6.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ caTools_1.17.1.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ snow_0.3-13.tar.gz 
    R CMD INSTALL -l $R_LIBS_USER/ phantompeakqualtools/spp_1.10.1.tar.gz 
    cd phantompeakqualtools/
    cp *R *txt /sw/apps/bioinfo/phantompeakqualtools/1.1/milou
    cd /sw/apps/bioinfo/phantompeakqualtools/1.1/milou
    vi *.R

Add #!/usr/bin/env Rscript to each .R script and make them executable.

    chmod +x *R
