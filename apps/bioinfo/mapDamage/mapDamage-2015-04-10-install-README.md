mapDamage/2015-04-10
====================

    git clone --recursive https://github.com/ginolhac/mapDamage.git

    module load python/2.7.6
    python setup.py install --prefix=/sw/apps/bioinfo/mapDamage/2015-04-10/milou

    module load bioinfo-tools pysam

    export R_LIBS_USER=/sw/apps/bioinfo/mapDamage/2015-04-10/R/milou
    R

Within R

    install.packages("inline")
    install.packages("gam")
    install.packages("Rcpp")
    install.packages("ggplot2")
    install.packages("RcppGSL")

